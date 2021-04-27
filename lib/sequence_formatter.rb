class SequenceFormatter
  def standardise(hop_sequence)
    notation = []
    if hop_sequence.is_a?(Hash)
      # formats the value of each pair such that the key is named in each element array
      # e.g. left: [1, 1, 0, 1] becomes 'left4 left2 left4'
      hop_sequence.each do |(key, hops_array)|
        notation << hops_array.each_with_index.map do |hop, index|
          hop_counter(hop, index, hops_array, key)
        end
      end
    else
      # shovel here so that notation is always an array of arrays for later steps
      notation << hop_sequence.each_with_index.map do |hop, index|
        hop_counter(hop, index, hop_sequence)
      end.compact
    end
    notation
  end

  private

  def hop_counter(hop, index, hops_array, key = 'left')
    if hop > 0
      hop += 1 while hops_array[index + hop] == 0
      "#{key}#{hops_array.length / hop}"
    end
  end
end
