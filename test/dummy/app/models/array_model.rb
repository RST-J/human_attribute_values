# frozen_string_literal: true

class ArrayModel < ActiveRecord::Base
  serialize :currencies, Array
end
