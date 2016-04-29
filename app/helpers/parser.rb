def create_csv_from_url(url)

  doc = Nokogiri::HTML(open("#{url}"))

  CSV.open("public/output.csv", 'w', {col_sep: ","}) do |csv|

    # doc.xpath('//table').each do |table|
    #   th_array = []
    #     table.xpath('th').each do |th|
    #       th_array << th.text
    #     end
    #     csv << th_array
    #   end

    th_array = ["Location","Name","Frequency","Duplex","Offset",
                "Tone","rToneFreq","cToneFreq","DtcsCode","DtcsPolarity",
                "Mode","TStep","Skip","Comment",
                "URCALL","RPT1CALL","RPT2CALL"]
    csv << th_array

    all_cells = doc.xpath('//table/td').map {|content| content.text }

    all_cells.each do |cell|
      cell.strip!
      cell.delete!(" ")
    end

    row_idx = 1
    until all_cells.empty?
      row_array = []
      row = all_cells.shift(8)
      row = format_row_as_UV5R_for_CHIRP(row_idx,row)
        row.each do |cell|
          row_array << cell
        end
      row_idx += 1
      csv << row_array
    end

  end
end


def format_row_as_UV5R_for_CHIRP(idx, row)
    frequency = row[0].slice(2..-2)

    case row[1]
      when "0.0"
        rToneFreq = 107.2
        tone = ''
      when ""
        rToneFreq = 107.2
        tone = "TSQL"
      else
        rToneFreq = row[1]
        tone = "TSQL"
    end

    call = row[4]
    distance = row[6]

    if row[0][-1] == "+" or row[0][-1] == "-"
      duplex = row[0].slice(-1)
      offset = 0.6
      else
      duplex = ""
      offset = 0
    end

    cToneFreq = rToneFreq
    dtcsCode = 23
    dtcsPolarity = "NN"
    mode = "FM"
    tstep = 5
    skip=""
    comment="#{distance}mi away in #{row[2]} #{row[3]}"
    urcall=""
    rpt1call=""
    rpt2call=""

    row = ["#{idx}",call,frequency,duplex,offset,tone,rToneFreq,cToneFreq,dtcsCode,dtcsPolarity,mode,tstep,skip,comment,urcall,rpt1call,rpt2call]

end

## For future update
# def parse_repeaters_from_csv
#     CSV.foreach(@file, :headers => true, :header_converters => :symbol).map do |row|
#     Recipe.new(row)
#     end
#   end
