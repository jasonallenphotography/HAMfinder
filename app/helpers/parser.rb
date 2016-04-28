def create_csv_from_url(url)

require 'rubygems'
require 'nokogiri'
require 'csv'

doc = Nokogiri::HTML(open("#{url}"))

csv = CSV.open("/tmp/output.csv", 'w',{:col_sep => ",", :quote_char => '\'', :force_quotes => true})
#doc.xpath('//table/tbody/tr').take(10).each do |row|
doc.xpath('//table/tbody/tr').each do |row|
binding.pry
  tarray = []
  row.xpath('td').each do |cell|
    tarray << cell.text
  end
  csv << tarray
end

csv.close



# doc = Nokogiri::HTML(open("#{url}"))

# doc.xpath('//table//tr').each do |row|
#     row.xpath('td').each do |cell|
#     print '"', cell.text.gsub("\n", ' ').gsub('"', '\"').gsub(/(\s){2,}/m, '\1'), "\", "
#   end
#   print "\n"
# end

# doc.parse('table').each do |table|
#     binding.pry
#   table.parse('tr').each do |row|
#       row.parse('td').each do |cell|
#       print '"', cell.text.gsub("\n", ' ').gsub('"', '\"').gsub(/(\s){2,}/m, '\1'), "\", "
#     end
#     print "\n"
#   end
# end

end
