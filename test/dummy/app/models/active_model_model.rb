# frozen_string_literal: true

class ActiveModelModel
  include ActiveModel::Model
  include HumanAttributeValues

  attr_accessor :boolean_attr, :decimal_attr, :integer_attr, :float_attr, :string_attr
end
