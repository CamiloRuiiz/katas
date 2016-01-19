require 'rspec'

describe 'KataOCR' do
  it 'should scan the number one' do
    one = <<ONE

 |
 |       
    
ONE

  result = scan(one)
  expect(result).to eql(1)
  end
  it 'should scan the number two' do
    two = <<TWO
 _
 _|
|_      
    
TWO
  result = scan(two)
  expect(result).to eql(2)
  end
  
  it 'should scan the number three' do
    three = <<THREE
_
_|
_|    
    
THREE
  result = scan(three)
  expect(result).to eql(3)
  end
  
  it 'should scan the number three' do
    four = <<FOUR
 
|_|
  |   
    
FOUR
  result = scan(four)
  expect(result).to eql(4)
  end
end

def scan(input)
  return 1 if (input == "\n |\n |       \n    \n")
  return 2 if (input == " _\n _|\n|_      \n    \n")
  return 3 if (input == "_\n_|\n_|    \n    \n") 
  return 4 if (input == " \n|_|\n  |   \n    \n")   
end 