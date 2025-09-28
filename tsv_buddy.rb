# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  TAB = "\t"
  NEWLINE = "\n"

  def row_hash(keys, values)
    Hash[keys.zip(values)]
  end

  def take_tsv(tsv)
    lines = tsv.lines(chomp: true)
    headers = lines.shift.split(TAB)
    @data = lines.map { |line| row_hash(headers, line.split(TAB)) }
  end

  def to_tsv
    values = @data.map { |tsv_entry| tsv_entry.values.join(TAB) }.join(NEWLINE)
    "#{@data[0].keys.join(TAB)}\n#{values}\n"
  end
end
