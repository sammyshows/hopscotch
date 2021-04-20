require_relative 'hop_formatter'
require_relative 'hop_counter'
require 'pry'

class HopConverter
  def initialize(hop_sequence)
    @hop_sequence = hop_sequence
    @foot = ''
    @notation = []

    @hop_formatter = HopFormatter.new
    format_hop
    @hop_counter = HopCounter.new
    hop_notation
  end

  def output
    @notation.map do |hop|
      "#{@foot}#{hop}"
    end.join(" ")
  end

  private

  def format_hop
    @foot, @notation = @hop_formatter.standardise(@hop_sequence)
  end

  def hop_notation
    @notation = @hop_counter.convert(@notation)
  end
end
