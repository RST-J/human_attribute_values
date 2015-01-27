module HumanAttributeValues
  extend ActiveSupport::Concern

  included {}

  def human_attribute_value(attribute, options = {})
    value = self.send attribute
    value.present? ? self.class.human_attribute_value(attribute, value, options) : ''
  end

  module ClassMethods
    def human_attribute_value(attribute, value, options = {})
      options = { count: 1 }.merge!(options)
      parts = attribute.to_s.split(".")
      attribute = parts.pop
      namespace = parts.join("/") unless parts.empty?
      value_scope = "#{self.i18n_scope}.values"
      if namespace
        defaults = lookup_ancestors.map do |klass|
          :"#{value_scope}.#{klass.model_name.i18n_key}/#{namespace}.#{attribute}.#{value}"
        end
        defaults << :"#{value_scope}.#{namespace}.#{attribute}.#{value}"
      else
        defaults = lookup_ancestors.map do |klass|
          :"#{value_scope}.#{klass.model_name.i18n_key}.#{attribute}.#{value}"
        end
      end
      defaults << :"values.#{attribute}.#{value}"
      defaults << options.delete(:default) if options[:default]
      defaults << attribute.humanize
      options[:default] = defaults
      I18n.translate(defaults.shift, options)
    end
  end
end


ActiveRecord::Base.send :include, HumanAttributeValues
