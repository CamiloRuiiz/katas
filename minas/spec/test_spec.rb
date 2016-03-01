describe 'KataMinesweeper' do
	it 'extract fields' do
		 	#Arrange
			input = "4 4\n*...\n....\n.*..\n....\n3 5\n**...\n.....\n.*...\n0 0"
			#Act
			#Accert
			expect(extract_fields(input)).to eq([["*...","....", ".*..", "...."],["**...", ".....", ".*..."]])
	end
end

def extract_fields(input)
	array_fields = input.split("\n")

	output = []
	count = 0
	field_length = field[count].to_i
	output << array_fields.slice((count+1)..(count+field_length))

end
