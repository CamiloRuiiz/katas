def intAdd(numbers)
  fail 'Negatives not allowed!' if error_negative?(numbers)
  return 0 if numbers.empty?
  
  numbers_normalize = normalize_delimiters(numbers)
  list = list_numbers(numbers_normalize)
  sum(list)
end

def error_negative?(numbers)
  numbers.match(/-\d/)
end

def normalize_delimiters(numbers)
  numbers.gsub(/[^-\d]/,',')
 ## one.gsub!(/(100\d),/,',')
end

def list_numbers(numbers)
  numbers.split(',')
end

def sum(numbers)
  ignore_numbers = numbers.map! do |i| 
    if i.to_i > 1000 
      i = 0 
    end 
    i.to_i 
  end 
  ignore_numbers.inject(:+)
end

describe 'String Calculator' do
  context 'With a method int Add(string numbers)' do
    it 'Empty String' do 
      expect(intAdd('')).to eq(0)
    end

    it 'Singles and Two numbers' do
      expect(intAdd('1,2')).to eq(3)
      expect(intAdd('1,')).to eq(1)
    end 

    it 'Lots of numbers' do
      expect(intAdd('4,5,6,9')).to eq(24)
    end

    it 'Allow the Add method to handle new lines between numbers' do 
      expect(intAdd('1\n2,3')).to eq(6)
    end
    
    it 'Support different delimiters ' do
      expect(intAdd('1,\n')).to eq(1)
    end
    it 'Allow the Add method to handle new lines between numbers' do 
      expect{intAdd('-1,3,-2')}.to raise_error('Negatives not allowed!')
    end
    
    it 'The beginning of the string will contain a separate line' do
      expect(intAdd('//;\n1;2')).to eq(3)
    end

    it 'Numbers bigger than 1000 should be ignored' do 
      expect(intAdd('2,1001,2')).to eq(4)
    end
    
    it 'for example: “//[***]\n1***2***3”' do 
      expect(intAdd('//[***]\n1***2***3')).to eq(6)
    end
  end
end
