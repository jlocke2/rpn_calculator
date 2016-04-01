class RPN

  def initialize
    @input = $stdin
    @output = $stdout
    @operands = []
    @operators = ["+","-","*","/"]
  end

  # simple infinite loop to allow the calculator to continue indefinitely
  # until intentionally exit with q or ctrl+c
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

  # allows for a nice > prompt on command line
  # while returning only the user input
  # rescue is to exit program, if user enters ctrl+c
  def get_input
    [(print '> '), @input.gets.rstrip][1]
  rescue Interrupt => e
    exit
  end

  # take last two operands and apply arithematic func to them
  # push the resulting value back to @operands array
  # then print this value to console
  def operate(func)
    new_value = @operands.pop(2).inject(func.to_sym)
    @operands.push(new_value)
    @output.puts trim(new_value)
  end

  # convert input to Float, if possible
  # then print value to command line after trimming value
  # push value to @operands array
  # if cannot convert to Float, rescue error and print helpful message to console
  def add_to_operands(user_input)
    user_input = Float(user_input)
    @output.puts trim(user_input)
    @operands.push(user_input.to_f)
  rescue
    @output.puts "Please enter a number, a math symbol, or the letter q"
  end

  # convert value to both Integer and Float
  # if value a whole number or contains only zeros after decimal, use Integer
  # otherwise it contains significant decimals and we use the Float
  def trim(num)
    integer, float = num.to_i, num.to_f
    integer == float ? integer : float
  end

end