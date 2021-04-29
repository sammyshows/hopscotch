class SequenceFormatter
  def standardise(hop_sequences)
    notation = []
    # formats the value of each pair such that the key is named in each element array
    # e.g. left: [1, 1, 0, 1] becomes 'left4 left2 left4'
    hop_sequences.each do |(key, hop_sequence)|
      notation << hop_sequence.each_with_index.map do |hop, index|
        if hop > 0
          hop_count = hop_counter(hop, index, hop_sequence)
          hop_formatter(hop_sequence, hop_count, key)
        end
      end
    end
    notation
  end

  private

  def hop_counter(hop, index, hop_sequence)
    hop += 1 while hop_sequence[index + hop] == 0
    hop
  end

  def hop_formatter(hop_sequence, hop_count, key)
    "#{key}#{hop_sequence.length / hop_count}"
  end
end
