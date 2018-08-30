# frozen_string_literal: true

class EnumModel < ActiveRecord::Base
  enum status: {dead_and_alive: 0, alive: 1, dead: 2}
end
