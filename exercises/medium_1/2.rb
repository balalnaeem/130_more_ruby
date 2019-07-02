# text analyzer - sandwich code

=begin
  Pseudocode:

  Al:
  - I need to first read the file inside the #process and then pass the contents of that file to the block
  - I can do that by saving the contents of the file in a varibale and then pass that variable to the block
  - Inside the block, code has to be about what I want to do with that information passed to the block
  - Since I am getting a text file here, and sample output requires paras, lines and words count
  - I can implement that in the block and return a string at the end
  - which the #process method can then output
  - so we are making sandwich code
=end

class TextAnalyzer
  def process
    contents = File.read('sample.txt')
    yield(contents)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |contents| puts "#{contents.split(/\n\n/).size} paragraphs" }
analyzer.process { |contents| puts "#{contents.split(/\n/).size} lines" }
analyzer.process { |contents| puts "#{contents.split(' ').size} words" }