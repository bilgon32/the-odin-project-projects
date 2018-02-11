require 'pstore'

class Game
  attr_reader :finished, :won

  def initialize
    random_word
    @word_array = @word.split("")
    @lifes = 6
    @hits = 0
    @wrong_letters = []
    @guesses = []
    @finished = false
    @won = false
    @guesses_array = Array.new(@word.length,"_")
  end

  # Checks if the letter belongs in the random word and replaces the underlines
  # with the letter
  def guess(letter)
    if letter == "save"
      save_game
      return
    end
    # Checks if the input is one valid letter
    if letter.length > 1 || letter == "" || letter < "a" || letter > "z"
      puts "Invalid input!"
      return
    # Checks if the input was already tried before
    elsif @wrong_letters.include?(letter) || @guesses.include?(letter)
      puts "Letter already tried!"
      return
    end
    # Returns the indexes of the matches found in the word
    matches_index = @word_array.each_index.select { |index| @word_array[index] == letter }
    # If there was a match, replace the underlines and checks if the game is over
    if matches_index.length > 0
      @guesses << letter
      matches_index.each { |index| @guesses_array[index] = @word_array[index] }
      @hits += matches_index.length
      if @hits == @word_array.length
        @finished = true
        @won = true
      end
    # If there wasn't a match take a life from the player and check if the game is over
    else
      @lifes -= 1
      @wrong_letters << letter
      if @lifes == 0
        @finished = true
      end
    end
    print_info
  end

  def load_game
    store = PStore.new("savegame.pstore")
    store.transaction do
      @word = store["word"]
      @word_array = store["word_array"]
      @lifes = store["lifes"]
      @hits = store["hits"]
      @wrong_letters = store["wrong_letters"]
      @guesses = store["guesses"]
      @finished = store["finished"]
      @won = store["won"]
      @guesses_array = store["guesses_array"]
    end
    print_info
  end

  private

  # Selects a random word from the file
  def random_word
    words = []
    File.readlines("5desk.txt").each do |word|
      words << word.chomp if word.length > 5 && word.length < 12
    end

    randomizer = Random.new
    chosen_word = words[randomizer.rand(words.length)]
    @word = chosen_word.downcase
  end

  # Prints the info on the screen between guesses or on start
  def print_info
    puts "\n######################\n\n"
    puts "GUESSES: " + @guesses.join(" ")
    puts "MISSES: " + @wrong_letters.join(" ")
    puts "LIFES: " + @lifes.to_s
    print @guesses_array.join(" ") + "\n"
    puts "\n######################\n\n"
  end

  def save_game
    store = PStore.new("savegame.pstore")
    store.transaction do
      store["word"] = @word
      store["word_array"] = @word_array
      store["lifes"] = @lifes
      store["hits"] = @hits
      store["wrong_letters"] = @wrong_letters
      store["guesses"] = @guesses
      store["finished"] = @finished
      store["won"] = @won
      store["guesses_array"] = @guesses_array
    end
    puts "GAME SAVED!"
  end
end

game = Game.new
puts "Type \"load\" to load a previous game or anything else to start a new one."
letter = gets.chomp
game.load_game if letter.downcase == 'load'

while !game.finished
  puts "Type a letter (or type \"save\" to save the game): "
  letter = gets.chomp
  game.guess(letter.downcase)
end
puts game.won ? "CONGRATULATIONS! YOU WON!" : "GAME OVER!"
