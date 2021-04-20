require_relative 'sequence_formatter'
require_relative 'notation_sorter'

class HopConverter
  def initialize(hop_sequence)
    @hop_sequence = hop_sequence
    @foot = ''
    @notation = []
    format_hop
    hop_notation
  end

  def output
    @notation.map do |hop|
      "#{@foot}#{hop}"
    end.join(' ')
  end

  private

  def format_hop
    @hop_formatter = SequenceFormatter.new
    @foot, @notation = @hop_formatter.standardise(@hop_sequence)
  end

  def hop_notation
    @hop_counter = NotationSorter.new
    @notation = @hop_counter.convert(@notation)
  end
end
