class SequenceFormatter
  def standardise(hop_sequence)
    notation = []
    if hop_sequence.is_a?(Hash)
      hop_sequence.each do |key, hops_array|
        value_array = hops_array.map { |hop| "#{key.to_s}#{hop * hops_array.reduce(:+)}" }
        notation << value_array
      end
    else
      # shovel here so that @notation is always an array of arrays
      notation << hop_sequence.map { |hop| "left#{hop * hop_sequence.reduce(:+)}" unless hop == 0 }.compact
    end
    notation
  end
end
