require 'watir'
require 'pry'

class Scraper
  def fetch

    title = ARGV[0]
    b     = Watir::Browser.new

    b.goto "https://www.imdb.com/title/#{title}/quotes"

    sleep(10)
    b.button(class: 'ipc-see-more__button', text: 'All').click
    sleep(10)

    quotes = b.divs(class: 'ipc-html-content-inner-div').map do |d|
      d.text
    end

    str = quotes.join("\n%\n")

    out_file = File.open("out.txt", 'w')
    out_file.puts(str)
    out_file.close
  end
end

Scraper.new.fetch
