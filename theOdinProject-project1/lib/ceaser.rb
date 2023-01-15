require 'pry-byebug'
# def convert_alphabet_to_index(letter)
#   alphabet_to_index = {} 
# end
 
# def index_to_alphabet()

def ceaser_cipher_v1(string, rotations)
  # 1. Setup the range from 'a' to 'z'
  alphabet_to_index = {}
  index_to_alphabet = ('a'..'z').to_a
  index_to_alphabet.each_with_index {|letter, index| alphabet_to_index[letter] = index}

  # 2. Iterate through the array
  encrypted_string = string.split('').map do |letter, index|
    if alphabet_to_index.has_key?(letter.downcase)
      upcase_check = letter == letter.downcase ? false : true
      current = alphabet_to_index[letter.downcase]
      current = (current + rotations) % 26
      if upcase_check
        index_to_alphabet[current].upcase
      else
        index_to_alphabet[current]
      end
    else
      letter
    end
    # binding.pry

  end
  
  encrypted_string.join('')
end

def ceaser_cipher (encrypted, rotations) 
  # Iterate through the letters of the encrypted word
  decrypted = []
  encrypted.each_char do |char|
    # Convert string to number
    current = char.ord

    # Check if current is acceptable to flip
    if (current >= 97 && current <= 122) # For lowercase
      # Set the uppercase flag to true
      upper = false
    elsif (current >= 65 && current <= 90)  # For uppercase
      # Set the uppercase flag to false
      upper = true
    else
      # Not an alphanumeric character. Return the same Character
      decrypted.push(char)
      next
    end

    # 1. Remove the 'front part'
    current_new = upper ? (current - 65) : (current - 97)
    
    # 2. Rotate the character
    current_new += rotations

    # 3. Modulus the current rotation by 26 so that 'z' will wrap to 'z'
    current_new %= 26

    # 4. Obtain the new character and push to storage
    new_current = upper ? (current_new + 65) : (current_new + 97)
    decrypted.push(new_current.chr)
  end
  decrypted.join('')
end