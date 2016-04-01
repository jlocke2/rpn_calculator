class RPN

  def initialize(opts = {})
    @input = opts[:input] || $stdin
    @output = opts[:output] || $stdout
    @operands = []
    @operators = opts[:operators] || ["+","-","*","/"]
  end

  # keep calculating until intentionally exited with q or ctrl+c
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


  def operate(func)
    new_value = @operands.pop(2).reduce(func.to_sym)
    @operands.push(new_value)
    @output.puts trim(new_value)
  end

  # Float() is quick way to convert user input
  # can handle integers, floats, and strings representing numbers
  # if cannot convert to Float, rescue error and print helpful message to console
  def add_to_operands(user_input)
    user_input = Float(user_input)
    @output.puts trim(user_input)
    @operands.push(user_input)
  rescue
    @output.puts "Please enter a number, a math symbol, or the letter q to exit"
  end

  # if num is a whole number or contains only zeros after the decimal, use integer
  # otherwise it contains significant values after the decimal, and we use float
  def trim(num)
    integer, float = num.to_i, num.to_f
    integer == float ? integer : float
  end

end