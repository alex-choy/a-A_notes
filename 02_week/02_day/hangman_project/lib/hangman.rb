class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample # gets a random ele from the array
  end

  def initialize
    @secret_word = Hangman.random_word 
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |letter, i|
      indices << i if letter == char
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  
# PART 2

  def try_guess(char)
    if already_attempted?(char)
      puts "That has already been attempted"
      return false
    else 
      @attempted_chars << char    
      correct_indices_arr = get_matching_indices(char)
      if correct_indices_arr.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, correct_indices_arr)
      end
      return true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    return false if @guess_word.join("") !=  @secret_word
    puts 'WIN'
    true
  end

  def lose?
    return false if @remaining_incorrect_guesses > 0
    puts 'LOSE'
    true
  end

  def game_over?
    return false if !win? && !lose?
    puts @secret_word
    true
  end

end
