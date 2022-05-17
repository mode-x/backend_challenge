# frozen_string_literal: true

require 'minitest/autorun'
require './body'
require './compute'

# BodyTest
class BodyTest < Minitest::Test
  def test_missing_file_paramater
    exception = assert_raises(ArgumentError) do
      Body.new('/echo', nil)
    end

    assert_equal 'Missing file parameter.', exception.message
  end

  def test_empty_file_paramater
    exception = assert_raises(ArgumentError) do
      Body.new('/echo', '')
    end

    assert_equal 'No file given.', exception.message
  end

  def test_wrong_path
    exception = assert_raises(ArgumentError) do
      Body.new('/echos', './test/matrix.csv').result
    end

    assert_equal 'This path is unknown.', exception.message
  end
end
