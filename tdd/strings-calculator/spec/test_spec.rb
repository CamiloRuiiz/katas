def error_negative?(numbers)
  numbers.match(/-\d/)
end

def sum(numbers)
  numbers.map!{|i| if i.to_i > 1000 then i = 0 end; i.to_i}.inject(:+)
end

def clean(numbers)
  one = numbers.gsub!(/[^-\d]/,',')
 ## one.gsub!(/(100\d),/,',')
end

def spliting(numbers)
  @numbersplited = numbers.split(',')
end

def intAdd(numbers)
  fail 'Negatives not allowed!' if error_negative?(numbers)
  
  return 0 if numbers.empty?
  
  clean(numbers)
  
  spliting(numbers)
  
  sum(@numbersplited)
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
  end
end
