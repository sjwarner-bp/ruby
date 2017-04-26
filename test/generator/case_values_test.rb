require_relative '../test_helper'

class ComplexCase < ExerciseCase
  def workload
    assert { Complex.foo(bar) }
  end
end

module Generator
  module CaseValues
    class ExtractorTest < Minitest::Test
      def test_multi_level_auto_extraction
        cases = Extractor.new(
          exercise_name: 'complex',
          exercise_data: File.read('test/fixtures/metadata/exercises/complex/canonical-data.json')
        ).extract

        expected = [
          ComplexCase.new(description: 'first generic verse', property: 'verse', number: 99,
                          expected: '99 bottles of beer on the wall, YAAAR', index: 0),
          ComplexCase.new(description: 'last generic verse', property: 'verse', number: 3,
                          expected: '3 bottles of beer on the wall, YAAAR', index: 1),
          ComplexCase.new(description: 'first two verses', property: 'verses', beginning: 99, end: 98,
                          expected: "99 bottles of beer on the wall, YAR, PIRATES CAN'T COUNT", index: 2)
        ]
        assert_equal expected, cases
      end
    end
  end
end
