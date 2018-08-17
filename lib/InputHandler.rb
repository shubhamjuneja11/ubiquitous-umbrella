# class to handle user input
class InputHandler
  def self.valid_string?(input_string)
    !input_string.to_s.strip.empty?
  end

  def self.convert_to_valid_strip_string(input_string)
    input_string.strip if valid_string?(input_string)
  end

  def self.valid_integer?(input_string)

    input_string.to_i.to_s == input_string.strip
  end

  def self.convert_to_valid_integer(input_string)
    input_string.to_i if valid_integer?(input_string)
  end

  def self.validate_input_data?(*input_data)
    is_data_valid = true
    input_data.each do |input|
      unless input
        is_data_valid = false
        break
      end
    end
    is_data_valid
  end
end