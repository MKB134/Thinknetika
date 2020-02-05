alphabet = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
vowels= "аеёиоуыэюя"
vowels_hash = {}

vowels.each_char {|vowel| vowels_hash[vowel] = alphabet.index(vowel) + 1}

puts vowels_hash