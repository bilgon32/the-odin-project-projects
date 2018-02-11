puts "Please enter a file name." if ARGV[0] == nil
lines = File.readlines(ARGV[0])
lines_count = lines.length
text = lines.join

# Count the words, characters, paragraphs and sentences
total_charactes = text.length
total_charactes_nospaces = text.gsub(/\s+/,'').length
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
stop_words_list = File.readlines("stop_words.txt").join.split(",")
all_words = text.scan(/\w+/)
keywords = all_words.select { |word| !stop_words_list.include?(word) }
good_percentage = ((keywords.length.to_f / word_count.to_f) * 100).to_i

# Analyzes the sentences and generates a summary using the best ones
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

# Give the analysis back to the user
puts "#{lines_count} lines"
puts "#{total_charactes} charactes"
puts "#{total_charactes_nospaces} charactes (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n#{ideal_sentences.join(". ")}."
