require 'hamfinder'

def create_csv_from_zip(zip)

  CSV.open("#{settings.root}/tmp/#{zip}.csv", 'w', {col_sep: ","}) do |csv|
    #Define UV5R headers for CHIRP columns
    th_array = ["Location",
                "Frequency",
                "Name",
                "Tone Mode",
                "cToneFreq",
                "rToneFreq",
                "DTCS Code",
                "DTCS Pol",
                "Duplex",
                "Offset",
                "Mode",
                "Tune Step",
                "Skip",
                "Comment",
                "URCALL",
                "RPT1CALL",
                "RPT2CALL"]

    #Push the CHIRP column headers to the output
    csv << th_array

    #Collect results from a fresh Hamfinder/RepeaterBook query
    results = Hamfinder::Parser.query( zip: zip, radius: 50 )
    repeaters = JSON.parse(results, symbolize_names: true)

    #Iterate through the collected repeaters, sanitize data, output to CHIRP CSV
    repeaters.each do |repeater|
      csv << format_repeater_for_UV5R_CHIRP(repeater, zip)
    end

  end
end

def format_repeater_for_UV5R_CHIRP(repeater, zip)
  station = repeater[1]
  formatted_row = [
    repeater[0].to_s.to_i,
    station[:frequency].to_f,
    station[:call],
    set_tonemode(station),
    set_cToneFreq(station),
    set_rToneFreq(station),
    set_dtcsCode(station),
    set_dtcsPolarity(station),
    set_duplex(station),  
    set_offset(station),
    set_mode(station),
    set_tstep(station),
    set_skip(station),
    set_comment(station, zip),
    set_urcall(station),
    rpt1call(station),
    rpt2call(station) ]
end

def set_tonemode(station)
  if station[:tone] != ""
    "TSQL"
  else
    "(None)"
  end
end

def set_cToneFreq(station)
  if station[:tone].to_f >= 67.0
    station[:tone][/([.0-9]+)/].to_f 
  else
    88.5
  end
end

def set_rToneFreq(station)
  if station[:tone].to_f >= 67.0
    station[:tone][/([.0-9]+)/].to_f 
  else
    88.5
  end
end

def set_dtcsCode(station)
  "023"
end

def set_dtcsPolarity(station)
  "NN"
end

def set_duplex(station)
    return "-" if station[:offset].include? "-"
    return "\+" if station[:offset].include? "+"
    return "" if station[:offset].include? "0MHz"
end

def set_offset(station)
  "0" if station[:offset] == "0MHz"
  station[:offset][/([.0-9]+)/].to_f if station[:offset] != ""
end

def set_mode(station)
  "FM"
end

def set_tstep(station)
  5
end

def set_skip(station)
  ""
end

def set_comment(station, zip)
  "#{station[:location]}, #{station[:state]} - #{station[:distance]}mi #{station[:direction]} of #{zip}"
end

def set_urcall(station)
  ""
end

def rpt1call(station)
  ""
end

def rpt2call(station)
  ""
end