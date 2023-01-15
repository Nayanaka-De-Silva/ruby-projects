def bubble_sort (array) 
  #bubble sort algorithm
	check = true
	while check do
		check = false
		array = array.each_index do |index|
			if index > 0 && array[index-1] > array[index]
				current_pair = array[index-1..index]
				array[index] = current_pair[0]
				array[index-1] = current_pair[1]
				check = true
			end
		end
	end
	return array
end