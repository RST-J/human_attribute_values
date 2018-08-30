# frozen_string_literal: true

require 'test_helper'

class ActiveModelTest < ActiveSupport::TestCase
  test 'value with count config' do
    instance = ActiveModelModel.new
    instance.string_attr = 'goose'
    assert_equal('one goose', instance.human_attribute_value(:string_attr), 'should use the mapping for count option 1 by default')
    assert_equal('one goose', instance.human_attribute_value(:string_attr, count: 1), 'should use the mapping for count option 1 when explicitly specified')
    assert_equal('some geese', instance.human_attribute_value(:string_attr, count: 2), 'should use the mapping for count other if count is not 1')
  end

  test 'value without count config' do
    instance = ActiveModelModel.new
    instance.integer_attr = 2
    assert_equal('odd prime', instance.human_attribute_value(:integer_attr), 'should successfully translate without a count option')
    assert_equal('odd prime', instance.human_attribute_value(:integer_attr, count: 1), 'should successfully translate with count option 1')
    assert_equal('odd prime', instance.human_attribute_value(:integer_attr, count: 2), 'should successfully translate with count option 2')
  end

  test 'hierarchy resolution for STI models' do
    grandchild = ActiveModelGrandChild.new
    grandchild.inherited_attr = :one
    assert_equal('active model grandchild value 1', grandchild.human_attribute_value(:inherited_attr), 'should use value for the actual class if present')

    grandchild.inherited_attr = :two
    assert_equal('active model child value 2', grandchild.human_attribute_value(:inherited_attr), 'should use value for the direct ancestor if it has a mapping')

    grandchild.inherited_attr = :three
    assert_equal('active model parent value 3', grandchild.human_attribute_value(:inherited_attr), 'should use value for the first parent class which has a mapping for the value')

    grandchild.inherited_attr = :four
    assert_equal('four', grandchild.human_attribute_value(:inherited_attr), 'should yield the value if there is no mapping in the type hierarchy')
  end

  test 'resolution of boolean values' do
    instance = ActiveModelModel.new
    instance.boolean_attr = false
    assert_equal('This is false', instance.human_attribute_value(:boolean_attr), 'should translate boolean false')

    instance.boolean_attr = true
    assert_equal('true', instance.human_attribute_value(:boolean_attr), 'should return the stringified boolean if there is no mapping')
  end

  test 'resolution for numeric values' do
    instance = ActiveModelModel.new
    instance.decimal_attr = '2.71'.to_d
    instance.float_attr = 3.14
    instance.integer_attr = 9001
    assert_equal('e', instance.human_attribute_value(:decimal_attr), 'should translate a decimal')
    assert_equal('Pi', instance.human_attribute_value(:float_attr), 'should translate a float')
    assert_equal('over 9000', instance.human_attribute_value(:integer_attr), 'should translate an integer')

    instance.decimal_attr = '9.99'.to_d
    instance.float_attr = 1.5
    instance.integer_attr = 1001
    assert_equal('9.99', instance.human_attribute_value(:decimal_attr), 'should return the stringified decimal if there is no mapping')
    assert_equal('1.5', instance.human_attribute_value(:float_attr), 'should return the stringified float if there is no mapping')
    assert_equal('1001', instance.human_attribute_value(:integer_attr), 'should return the stringified integer if there is no mapping')
  end
end
