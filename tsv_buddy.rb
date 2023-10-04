# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    tsv_line = tsv.split("\n")
    title = tsv_line[0].split("\t")
    @data = tsv_line [1..].map do |line|
      item = line.split("\t")
      Hash[title.zip(item)]
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = []
    tsv << @data[0].keys.join("\t")
    @data.each do |item|
      tsv << item.values.join("\t")
    end
    "#{tsv.join("\n")}\n"
  end
end
