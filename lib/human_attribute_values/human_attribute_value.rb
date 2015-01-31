module HumanAttributeValues
  extend ActiveSupport::Concern

  included {}

  def human_attribute_value(attribute, options = {})
    value = self.send attribute
    self.class.human_attribute_value(attribute, value, options)
  end

  module ClassMethods
    def human_attribute_value(attribute, value, options = {})
      return '' if value.nil?
      # do not translate values of associations
      return '' if reflect_on_all_associations.any? { |assoc| assoc.name == attribute.to_sym }
      options = { count: 1 }.merge!(options)
      parts = attribute.to_s.split(".")
      attribute = parts.pop
      namespace = parts.join("/") unless parts.empty?
      value_scope = "#{self.i18n_scope}.values"
      # dots would mean a new nesting level in YAML files
      key = value.is_a?(Numeric) ? value.to_s.gsub('.', '_') : value
      if namespace
        defaults = lookup_ancestors.map do |klass|
          :"#{value_scope}.#{klass.model_name.i18n_key}/#{namespace}.#{attribute}.#{key}"
        end
        defaults << :"#{value_scope}.#{namespace}.#{attribute}.#{key}"
      else
        defaults = lookup_ancestors.map do |klass|
          :"#{value_scope}.#{klass.model_name.i18n_key}.#{attribute}.#{key}"
        end
      end
      defaults << :"values.#{attribute}.#{key}"
      defaults << options.delete(:default) if options[:default]
      defaults << value.to_s
      options[:default] = defaults
      I18n.translate(defaults.shift, options)
    end
  end
end


ActiveRecord::Base.send :include, HumanAttributeValues
