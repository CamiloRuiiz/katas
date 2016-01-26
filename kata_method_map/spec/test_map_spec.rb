def map_op(original, &block)
  result = []
  original.each do |i| 
    result << yield(i)
  end
   result
end

def inject_op(original, acc, &block) 
  ac = acc
  original.map do |i|
    ac = yield(ac,i)  
  end
  ac
end

describe 'Inject method' do
    it '#inject_op' do
      expect(inject_op([1, 2], 0){ |acc, x| x+acc }).to eq(3)
      expect(inject_op([1, 2], 1){ |acc, x| x*acc }).to eq(2)
    end
  
end

describe 'Map method' do
    it '#map_op' do
      expect(map_op([1, 2]){ |x| x*2 }).to eq([2,4])
    end
  
end
