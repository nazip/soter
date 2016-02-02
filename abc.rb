# class Roulette
#   def method_missing(name, *args)
#     person = name.to_s.capitalize
#     number = 0
#     3.times do
#       number = rand(10) + 1
#       puts "#{number}..."
#     end
#     "#{person} got a #{number}"
#   end
# end

# number_of = Roulette.new
# puts number_of.bob
# puts number_of.frank

my_var = "Success"

MyClass = Class.new do
  "#{my_var} in the class definition"
  define_method :my_method do
    "#{my_var} in the method"
  end
end

p MyClass.new.my_method
