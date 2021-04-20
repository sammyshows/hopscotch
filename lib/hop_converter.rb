class HopConverter
  def initialize(hop_sequence)
    @hop_sequence = hop_sequence.select { |hop| hop == 1 }
    @foot = "left"
    @notation = []
    convert
  end

  def output
    @notation.map do |hop|
      "#{@foot}#{hop}"
    end.join(" ")
  end

  private

  def convert
    @notation = @hop_sequence.map { |hop| hop * @hop_sequence.length }
  end
end
