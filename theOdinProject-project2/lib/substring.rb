def substring(string, dictionary) 
	output = Hash.new
	dictionary.each do |word|
		word_count = string.split.count {|string_word| string_word.downcase.match?(word)}
		output[word] = word_count if word_count > 0
	end
	output
end