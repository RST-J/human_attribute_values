# frozen_string_literal: true

require 'test_helper'

class ActiveRecordTest < ActiveSupport::TestCase
  test 'attribute with count config' do
    answer = TheAnswer.new(ultimate_truth: '42')
    assert_equal('was calculated by Deep Thought', answer.human_attribute_value(:ultimate_truth), 'should use the mapping for count option 1 by default')
    assert_equal('was calculated by Deep Thought', answer.human_attribute_value(:ultimate_truth, count: 1), 'should use the mapping for count option 1 when explicitly specified')
    assert_equal('there is only one ultimate answer', answer.human_attribute_value(:ultimate_truth, count: 2), 'should use the mapping for count other if count is not 1')
  end

  test 'attribute without count config' do
    answer = TheAnswer.new(ultimate_truth: 'wissen ist Nacht')
    assert_equal('coined by Prof. Dr. Abdul Nachtigaller', answer.human_attribute_value(:ultimate_truth), 'should successfully translate without a count option')
    assert_equal('coined by Prof. Dr. Abdul Nachtigaller', answer.human_attribute_value(:ultimate_truth, count: 1), 'should successfully translate with count option 1')
    assert_equal('coined by Prof. Dr. Abdul Nachtigaller', answer.human_attribute_value(:ultimate_truth, count: 2), 'should successfully translate with count option 2')
  end

  test 'mime type definition with a dot' do
    answer = TheAnswer.new(ultimate_truth: 'application/x-my.mime2')
    assert_equal('Custom Mime Type 2', answer.human_attribute_value(:ultimate_truth), 'should successfully translate the mime type with dot')

    answer.ultimate_truth = 'application/x-my.untranslated_mime'
    assert_equal('application/x-my.untranslated_mime', answer.human_attribute_value(:ultimate_truth), 'should return the unmodified value for an untranslated mime type with dot')
  end

  test 'hierarchy resolution for STI models' do
    grandchild = GrandChild.new(field: '1')
    assert_equal('grandchild value 1', grandchild.human_attribute_value(:field), 'should use value for the actual class if present')

    grandchild.field = '2'
    assert_equal('child value 2', grandchild.human_attribute_value(:field), 'should use value for the direct ancestor if it has a mapping')

    grandchild.field = '3'
    assert_equal('parent value 3', grandchild.human_attribute_value(:field), 'should use value for the first parent class which has a mapping for the value')

    grandchild.field = '4'
    assert_equal('4', grandchild.human_attribute_value(:field), 'should yield the value if there is no mapping in the type hierarchy')
  end

  test 'resolution of boolean values' do
    boolean_model = BooleanModel.new(boolean_field: true)
    assert_equal('This is true', boolean_model.human_attribute_value(:boolean_field), 'should translate boolean true')

    boolean_model.boolean_field = false
    assert_equal('false', boolean_model.human_attribute_value(:boolean_field), 'should return the stringified boolean if there is no mapping')
  end

  test 'resolution for numeric values' do
    numeric_model = NumericModel.new(integer_field: 1, decimal_field: 1.0)
    assert_equal('One', numeric_model.human_attribute_value(:integer_field), 'should translate an integer')
    assert_equal('One point zero', numeric_model.human_attribute_value(:decimal_field), 'should translate a decimal')

    numeric_model.integer_field = 2
    numeric_model.decimal_field = 2.0
    assert_equal('2', numeric_model.human_attribute_value(:integer_field), 'should return the stringified integer if there is no mapping')
    assert_equal('2.0', numeric_model.human_attribute_value(:decimal_field), 'should return the stringified decimal if there is no mapping')
  end

  test 'resolution for associations' do
    lexicon = Lexicon.new
    the_answer = TheAnswer.new(lexicon: lexicon)
    assert_equal(lexicon.to_s, the_answer.human_attribute_value(:lexicon), 'should return .to_s for associations 1')
    assert_equal(lexicon.the_answers.to_s, lexicon.human_attribute_value(:the_answers), 'should return .to_s for associations 2')
  end

  test 'resolution for enums' do
    enum_model = EnumModel.new(status: :dead_and_alive)
    assert_equal('The box has not been opened yet', enum_model.human_attribute_value(:status), 'should use the enumerated values for lookup')

    enum_model.status = :alive
    assert_equal('alive', enum_model.human_attribute_value(:status), 'should return the stringified enum value if no translation is defined 1')
    enum_model.status = 2
    assert_equal('dead', enum_model.human_attribute_value(:status), 'should return the stringified enum value if no translation is defined 2')
  end
end
