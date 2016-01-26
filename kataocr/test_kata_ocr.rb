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
  it 'converts account' do
    first_account = <<ACCOUNT
     _  _        _  _     _
 |_| _| _|  |  | _| _||_| _|
   ||_  _|  |  ||_ |_   | _|

ACCOUNT
    result = scan(first_account)
    expect(result).to eq(423112243)
  end
end

def scan(input)
  
  
  scan_store = {
  "\n |\n |\n\n" => 1 , 
  " _\n _|\n|_ \n\n" => 2 , 
  "_\n_|\n_|\n\n" => 3,
  " \n|_|\n  |\n\n" => 4 
  }
  
  scan_store[input]
  
  a = first_account.split("\n")
  a.map!{|i| b = i.split("")}
end 