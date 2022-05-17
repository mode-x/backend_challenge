# frozen_string_literal: true

# Body class contains result method which maps paths to methods.
class Body
  # The instance of the Body class in created with a request path and file from the request parameter.
  # An instance of the Compute class is created if the file provided,
  # but an ArgumentError is raised if the file is not given or is empty.
  def initialize(path, file)
    @path = path

    raise ArgumentError, 'Missing file parameter.' unless file
    raise ArgumentError, 'No file given.' if file.empty?
    raise ArgumentError, 'The file must be a csv file.' unless File.extname(file) == ".csv"

    @compute = Compute.new(file)
  end

  # Maps paths to methods and returns a string.
  # Unknown paths will return an ArguementError
  def result
    case @path
    when '/echo'
      @compute.echo
    when '/invert'
      @compute.invert
    when '/flatten'
      @compute.flatten
    when '/sum'
      @compute.sum.to_s
    when '/multiply'
      @compute.multiply.to_s
    else
      raise ArgumentError, 'This path is unknown.'
    end
  end
end
