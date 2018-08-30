class ActiveModelModel
  include ActiveModel::Model

  attr_accessor :boolean_attr, :decimal_attr, :integer_attr, :float_attr, :string_attr
end
