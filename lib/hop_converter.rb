require_relative 'sequence_formatter'
require_relative 'notation_filter'
require 'pry'

class HopConverter
  def initialize(hop_sequence)
    @hop_sequence = hop_sequence
    @notation = []
    format_sequence
    filter_notation
  end

  def output
    if @notation.size > 1
      @notation.transpose.map { |array| array.reduce(:+) }.join(' ')
    else
      @notation.join(' ')
    end
  end

  private

  def format_sequence
    @notation = SequenceFormatter.new.standardise(@hop_sequence)
  end

  def filter_notation
    @notation = NotationFilter.new.convert(@notation)
  end
end
