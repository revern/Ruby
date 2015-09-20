1.upto(100) do |n|
  fizz = (n % 3 == 0) ? 'Fizz' : nil
  buzz = (n % 5 == 0) ? 'Buzz' : nil
  print (fizz || buzz) ? "#{fizz}#{buzz} " : "#{n} "
end