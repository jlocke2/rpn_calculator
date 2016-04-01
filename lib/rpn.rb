class RPN

  def initialize
    @input = $stdin
    @output = $stdout
    @operands = []
    @operators = ["+","-","*","/"]
  end

  # simple infinite loop to allow the calculator to continue indefinitely
  # until intentionally exited with q or ctrl+c
  def start
    loop {
      user_input = get_input

      exit if user_input == "q"

      if @operators.include? user_input
        operate(user_input)
      else
        add_to_operands(user_input)
      end
    }
  end

  private

  # allows for a nice '>' prompt on command line
  # while returning only the user input
  # rescue is to exit program, if user enters ctrl+c
  def get_input
    [(print '> '), @input.gets.rstrip][1]
  rescue Interrupt => e
    exit
  end

  # take the last two operands and apply arithmetic function to them
  # push the resulting new_value back to @operands array
  # then print this new_value to console
  def operate(func)
    new_value = @operands.pop(2).inject(func.to_sym)
    @operands.push(new_value)
    @output.puts trim(new_value)
  end

  # convert user_input to Float, if possible
  # then print value to command line after trimming
  # push value to @operands array
  # if cannot convert to Float, rescue error and print helpful message to console
  def add_to_operands(user_input)
    user_input = Float(user_input)
    @output.puts trim(user_input)
    @operands.push(user_input)
  rescue
    @output.puts "Please enter a number, a math symbol, or the letter q to exit"
  end

  # convert num to both Integer and Float
  # if num is a whole number or contains only zeros after the decimal, use integer
  # otherwise it contains significant values after the decimal, and we use float
  def trim(num)
    integer, float = num.to_i, num.to_f
    integer == float ? integer : float
  end

end