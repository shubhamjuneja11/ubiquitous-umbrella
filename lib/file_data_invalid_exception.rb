class FileDataInvalidException < StandardError
  def initialize(exception_message = "Invalid data")
    super
  end
end
