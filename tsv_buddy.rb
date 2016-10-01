# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split("\n")
    key = lines[0].split("\t")
    tmp = []
    lines[1..-1].each do |line|
      values  = line.chomp.split("\t")
      result = Hash.new
      key.each_index do |x|
        result[key[x]] = values[x]
      end
      tmp<<result
      @data = tmp
    end
  end
  def to_tsv
    valueValue = ""
    keyValue = @data[0].keys.join("\t")+"\n"

    @data[0..-1].each_index do |i| #each is data object
      valueValue += @data[i].values.join("\t")+"\n"
    end
    return keyValue + valueValue
  end
end
