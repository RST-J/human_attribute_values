# frozen_string_literal: true

class ActiveModelParent
  include ActiveModel::Model
  include HumanAttributeValues

  attr_accessor :inherited_attr
end
