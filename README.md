# human_attribute_values
[![Build Status](https://travis-ci.org/RST-J/human_attribute_values.svg?branch=master)](https://travis-ci.org/RST-J/human_attribute_values)
[![Gem Version](https://badge.fury.io/rb/human_attribute_values.svg)](http://badge.fury.io/rb/human_attribute_values)

human_attribute_values is a Rails plugin which provides translation for model attribute values using the Rails I18n API (analogously to [human_attribute_name](http://apidock.com/rails/v4.1.8/ActiveModel/Translation/human_attribute_name)).

## Installation
```
gem install human_attribute_values
```

## Supported versions
  * Rails: >= 4.2.10
  * Ruby: MRI >= 2.0

## Usage
The gem defines ``human_attribute_value`` on each model, both as instance and as class method.
To translate a value it uses the I18n API. The translations are looked up from the current locale file under the key ``'activerecord.values.model_name.attribute_name.value'`` by default.

Locale:
```yml
en:
  activerecord:
    values:
      schroedinger:
        cat_status:
          dead_and_alive: The box is still closed.
          alive: You opened the box and kitty purrs.
```

Translations:
```ruby
class Schroedinger < ActiveRecord::Base
  enum cat_status: {dead_and_alive: 0, alive: 1, dead: 2}
end

# Translation on instances by passing the attribute to be translated
Schroedinger.new(cat_status: :dead_and_alive).human_attribute_value(:cat_status)
 => "The box is still closed."

# Translation on the model class by passing attribute and value
Schroedinger.human_attribute_value(:cat_status, :alive)
 => "You opened the box and kitty purs."

# If there is no translation specified in the locale, the stringified value is returned
Schroedinger.human_attribute_value(:cat_status, :dead)
 => "dead"

```

### Boolean values
To translate boolean values, the key must be specified as string:
```yml
en:
  activerecord:
    values:
      user:
        active:
          'true': active
          'false': inactive
```

### Numeric values
If there is a reason to translate numbers, their keys must also be given as strings. For decimal values the dot is replaced by an underscore for the lookup.
```yml
en:
  activerecord:
    values:
      magic_number:
        value:
          '3_14': Pi
          '42': 'the answer to life, the universe and everything'
```

### Child classes
For models with single table inheritance (STI), the lookup will start with the translations for the class and go up through the class hierarchy and use the translation for the closest parent if there is any.
