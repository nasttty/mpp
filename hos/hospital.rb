require 'open-uri'
require 'nokogiri'
require 'csv'

def parse (url)
  html = URI.open(url)
  nokogiri = Nokogiri::HTML(html)
  list = nokogiri.css('div.columnWrapper li a')
  save(list)
end

def save (parse)
  CSV.open("hospital.csv", 'w') do |element|

    parse.each do |hospital|
      element << [hospital.text.strip]
    end

  end

end

parse("https://www.hospitalsafetygrade.org/all-hospitals")
