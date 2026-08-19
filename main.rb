require_relative 'chores/ruby/interval'

[1, 2, 4.5, 5, 6].each do |x|
    puts "#{x} -> #{in_interval?(2,x,3)}"
end
