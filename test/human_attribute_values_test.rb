require 'test_helper'

class HumanAttributeValuesTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, HumanAttributeValues
  end

  def create_answer(value)
    TheAnswer.new ultimate_truth: value
  end

  test "localization for '42'" do
    answer = create_answer('42')
    assert_equal(answer.human_attribute_value(:ultimate_truth), 'was found by Douglas Adams')
    assert_equal(answer.human_attribute_value(:ultimate_truth, count: 2), 'there is only one ultimate answer')
  end

  test "localization for nil values" do
    answer = create_answer(nil)
    assert_equal(answer.human_attribute_value(:ultimate_truth), '')
  end
end