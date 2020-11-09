# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include HumanAttributeValues

  self.abstract_class = true
end
