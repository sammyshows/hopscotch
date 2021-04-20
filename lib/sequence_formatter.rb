class SequenceFormatter
  def standardise(hop_sequence)
    notation = []
    if hop_sequence.is_a?(Hash)
      # formats the value of each pair such that the key is named in each element array
      # e.g. left: [1, 1] becomes 'left2 left2'
      hop_sequence.each do |key, hops_array|
        notation << hops_array.map { |hop| "#{key}#{hop * hops_array.reduce(:+)}" }
      end
    else
      # shovel here so that notation is always an array of arrays for later steps
      notation << hop_sequence.map { |hop| "left#{hop * hop_sequence.reduce(:+)}" unless hop == 0 }.compact
    end
    notation
  end
end
