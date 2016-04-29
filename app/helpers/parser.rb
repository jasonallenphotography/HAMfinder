def create_csv_from_url(url)

  doc = Nokogiri::HTML(open("#{url}"))

  CSV.open("public/output.csv", 'w', {col_sep: ","}) do |csv|

    doc.xpath('//table').each do |table|
      th_array = []
        table.xpath('th').each do |th|
          th_array << th.text
        end
        csv << th_array
      end

    all_cells = doc.xpath('//table/td').map {|content| content.text }

    all_cells.each do |cell|
      cell.strip!
      cell.delete!(" ")
    end

    until all_cells.empty?
      row_array = []
      row = all_cells.shift(8)
        row.each do |cell|
          row_array << cell
        end
      csv << row_array
    end

  end
end



def parse_repeaters_from_csv
    CSV.foreach(@file, :headers => true, :header_converters => :symbol).map do |row|
    Recipe.new(row)
    end
  end
