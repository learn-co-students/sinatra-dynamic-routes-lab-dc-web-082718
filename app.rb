require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params[:name]
    reversed = @name.reverse
    "#{reversed}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    squared = @number * @number

    "#{squared}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]

    answer = ''

    @num.times do
      answer += @phrase
    end
    answer
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]

    string = "#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}."
  end

  get '/:operation/:number1/:number2' do
    @op = params[:operation]
    @n1 = params[:number1].to_i
    @n2 = params[:number2].to_i

    answer = ''

    if @op == "add"
      answer << "#{@n1 + @n2}"
      # binding.pry
    elsif @op == "subtract"
      answer << "#{@n1 - @n2}"
    elsif @op == "multiply"
      answer << "#{@n1 * @n2}"
    elsif @op == "divide"
      answer << "#{@n1/@n2}"
    end
    answer
  end

end
