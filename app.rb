require 'pry'
require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/' do

    redirect '/say/2/yes!'
  end

  get '/reversename/:name' do
  # that accepts a name and renders the name backwards.
    params[:name].reverse
  end

  get '/square/:number' do
  # Create a dynamic route at get '/square/:number' that accepts a number and returns the square of that number.
  # binding.pry
    @square_of_num = params[:number].to_i ** 2
    erb :square
  end

  get '/say/:number/:phrase' do
  # accepts a number and a phrase and returns that phrase in a string the number of times given.
    @num = params[:number].to_i
    @phrase = params[:phrase]
    # binding.pry

    if @num then erb :say end
    # else erb :words end
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
   # that accepts five words and returns a string containing all five words (i.e. word1 word2 word3 word4 word5).
   @params = params
   @concatenated_phrase = params.collect { |key, word| word }.join(' ') + "."
   # binding.pry
   if @params[:word1].is_a? String then erb :words end
  end

  get '/:operation/:number1/:number2' do
    # accepts an operation (add, subtract, multiply or divide) and performs the operation on the two numbers provided. For example, going to /add/1/2 should render 3.
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i

    case params[:operation]
    when "add"
      @evaluation = num2 + num1
    when "subtract"
      @evaluation = num1 - num2
    when "multiply"
      @evaluation = num2 * num1
    when "divide"
      @evaluation = num1 / num2
    end

    erb :math_operations
  end
#
end
