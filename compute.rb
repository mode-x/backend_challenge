# frozen_string_literal: true

# Compute class contains methods implementing the solution for the application.
class Compute
  require 'csv'

  # The instance of the Compute class in created with a file path passed in as a string.
  # If the file path passed in is not valid an ArgumentError message is raised.
  # The file is passed in as an argument to the csv reader which parses the file.
  # The data gotten from the file is a 2-dimensional array.
  # Example:
  #   Given the file path "./test/matrix.csv" the data is [[1,2,3],[4,5,6],[7,8,9]].
  # The return data is validated to ensure that each array has equal number of items
  # and that number of rows equals the number of columns
  # which is required to form a square matrix.
  def initialize(file)
    @data = CSV.read(file)
    raise ArgumentError, 'Unequal number of items in array.' unless columns_arr.size == 1
    raise ArgumentError, 'Unequal rows and columns.' unless rows == columns
  rescue Errno::ENOENT => e
    raise ArgumentError, e.message.gsub(' @ rb_sysopen', '')
  end

  # Returns a string matrix of the inputed file
  # Example:
  #   1,2,3
  #   4,5,6
  #   7,8,9
  def echo
    matrix(flatten)
  end

  # Returns an invert string matrix of the inputed file
  # Example:
  #   1,4,7
  #   2,5,5
  #   3,6,9
  def invert
    matrix(flatten(@data.transpose))
  end

  # Returns a single line string of the inputed file
  # Example:
  #   1,2,3,4,5,6,7,8,9
  def flatten(data = nil)
    (data || @data).flatten.join(',')
  end

  # Returns the sum of the inputed file after calling the flatten method
  # Example:
  #   Given 1,2,3,4,5,6,7,8,9 the sum is 45
  def sum
    flatten.split(',').map(&:to_i).sum
  end

  # Returns the product of the inputed file after calling the flatten method
  # Example:
  #   Given 1,2,3,4,5,6,7,8,9 the product is 362880
  def multiply
    flatten.split(',').map(&:to_i).inject(:*)
  end

  private

  # Returns the number of rows in the inputed file
  # Example:
  #   Given [[1,2,3],[4,5,6],[7,8,9]] the number of rows is 3
  def rows
    @data.size
  end

  # Returns the aggregate number of columns for each row in the inputed file
  # Example:
  #   Given [[1,2,3],[4,5,6],[7,8,9]] the columns is [3]
  def columns_arr
    @data.collect(&:size).uniq
  end

  # Returns the number of columns in the inputed file
  # Example:
  #   Given [[1,2,3],[4,5,6],[7,8,9]] the columns is 3
  def columns
    columns_arr.pop
  end

  # Returns a matrix of the inputed string
  # Example:
  #   Given "1,2,3,4,5,6,7,8,9" this method returns "1,2,3\n4,5,6\n7,8,9"
  #   which produces:
  #     1,2,3
  #     4,5,6
  #     7,8,9
  def matrix(str)
    str = str.split(',')

    cstr = str.clone

    count = 0

    range_start = columns - 1
    range_end = columns

    slice_range_start = range_start
    slice_range_end = range_end

    index = columns - 1

    while count < rows - 1
      str.slice!(slice_range_start..slice_range_end)

      str.insert(index, cstr[range_start..range_end].join("\n"))

      count += 1

      range_start += columns
      range_end += columns

      slice_range_start = range_start - 1
      slice_range_end = range_end - 1

      index += (columns - 1)
    end
    str.join(',')
  end
end
