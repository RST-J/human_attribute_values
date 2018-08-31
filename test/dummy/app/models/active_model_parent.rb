# frozen_string_literal: true

class ActiveModelParent
  include ActiveModel::Model

  attr_accessor :inherited_attr
end
