# human_attribute_values
[![Build Status](https://travis-ci.org/RST-J/human_attribute_values.svg?branch=master)](https://travis-ci.org/RST-J/human_attribute_values)
[![Gem Version](https://badge.fury.io/rb/human_attribute_values.svg)](http://badge.fury.io/rb/human_attribute_values)

human_attribute_values is a Rails plugin which provides translation for model attribute values using the Rails I18n API (analogously to [human_attribute_name](https://apidock.com/rails/v4.2.7/ActiveModel/Translation/human_attribute_name)).

## Installation
```
gem install human_attribute_values
```

## Supported versions
  * Rails: >= 4.2.10
  * Ruby: MRI >= 2.3.0

## Usage

The module `HumanAttributeValues` defines `human_attribute_value` as both an instance and class method.


### ActiveRecord

You can include the module in any specific models you wish to translate directly, or include it in `ApplicationRecord` globally.

```ruby
class ApplicationRecord < ActiveRecord::Base
  include HumanAttributeValues
  self.abstract_class = true
end
```

To translate a value it uses the I18n API. The translations are looked up from the current locale file under the key `'activerecord.values.{model_name}.attribute_name.value'` by default.

### ActiveModel

You can include the module in any specific models you wish to translate directly, or include it in `ApplicationRecord` globally.

```ruby
class Model
  include ActiveModel::Model
  include HumanAttributeValues

  attr_accessor ...
end
```

To translate a value it uses the I18n API. The translations are looked up from the current locale file under the key `'activemodel.values.{model_name}.attribute_name.value'` by default.

### Locale:
```yml
en:
  activemodel:
    values:
      file_model:
        content_type:
          application/pdf: PDF
          application/vnd_openxmlformats-officedocument_spreadsheetml_sheet: Excel/Calc
  activerecord:
    values:
      schroedinger:
        cat_status:
          dead_and_alive: The box is still closed.
          alive: You opened the box and kitty purrs.
```

### Translations:
```ruby
# For ActiveRecord

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

# For ActiveModel (the same except the lookup namespace)
class FileModel
  include ActiveModel::Model

  attr_accessor :content_type
end

file = FileModel.new(content_type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
file.human_attribute_value(:content_type)
 => "Excel/Calc"

FileModel.human_attribute_value(:content_type, 'application/pdf')
 => "PDF"

FileModel.human_attribute_value(:content_type, 'text/plain')
 => "text/plain"
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

### Strings and Symbols
Starting with version 1.2.0, dots in strings and symbols (actually in all values) are also replaced by an underscore for the lookup (before this was only done for numbers).


### Child classes
For models with single table inheritance (STI), the lookup will start with the translations for the class and go up through the class hierarchy and use the translation for the closest parent if there is any.
