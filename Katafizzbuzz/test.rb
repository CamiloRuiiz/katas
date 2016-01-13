require 'rspec'

describe 'KataFizzBuzz' do
  
  it "print numbers from 1 to 10" do
    expect(bucle(10)).to eq([1,2,"Fizz",4,"Buzz","Fizz",7,8,"Fizz","Buzz"])
  end
  
  it "prints 'Fizz' instead of the number for multiples of three" do
    helper([3, 6, 9], "Fizz")
  end
  
  it "prints 'Buzz' instead of the number for multiples of five " do
     helper([5, 20, 25], "Buzz")
  end 
  
  it "prints 'FizzBuzz' instead of the number for multiples of five and three" do
    helper([15, 30], "FizzBuzz")
  end
  
  it "prints numbers" do
    number = 1
    expect(fizz(number)).to eq(1)
  end
end

def helper data, result
  data.each do |number|
    expect(fizz(number)).to eq(result)
  end
end

def bucle(n)
  array = []
  (1..n).each do |number|
    array << fizz(number) 
  end
  array
end

def fizz(number)
 return "Fizz" if number % 3 == 0 && number % 5 != 0
 return "Buzz" if number % 5 == 0 && number % 3 != 0
 return "FizzBuzz" if number % 3 == 0 && number % 5 == 0
 return number if number % 3 != 0 && number % 5 != 0
end

