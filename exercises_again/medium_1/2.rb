# text_analyzer - Sandwich Code

class TextAnalyzer
  def process
    file = File.open('text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count } paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count } lines" }
analyzer.process { |file| puts "#{file.split(" ").count } words" }