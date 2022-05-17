# frozen_string_literal: true

require 'minitest/autorun'
require './compute'

# ComputeTest
class ComputeTest < Minitest::Test
  def setup
    @compute = Compute.new('./test/matrix.csv')
  end

  def test_wrong_file_name
    exception = assert_raises(ArgumentError) do
      Compute.new('./test/matrixs.csv')
    end

    assert_equal 'No such file or directory - ./test/matrixs.csv', exception.message
  end

  def test_number_of_items_in_each_row
    exception = assert_raises(ArgumentError) do
      Compute.new('./test/matrix_unequal_items.csv')
    end

    assert_equal 'Unequal number of items in array.', exception.message
  end

  def test_matrix
    exception = assert_raises(ArgumentError) do
      Compute.new('./test/matrix_unequal_rows_and_cols.csv')
    end

    assert_equal 'Unequal rows and columns.', exception.message
  end

  def test_echo
    assert_equal @compute.echo, "1,2,3\n4,5,6\n7,8,9"
  end

  def test_invert
    assert_equal @compute.invert, "1,4,7\n2,5,8\n3,6,9"
  end

  def test_flatten
    assert_equal @compute.flatten, '1,2,3,4,5,6,7,8,9'
  end

  def test_sum
    assert_equal @compute.sum, 45
  end

  def test_multiply
    assert_equal @compute.multiply, 362_880
  end
end
