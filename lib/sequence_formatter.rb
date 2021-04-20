class SequenceFormatter
  def standardise(hop_sequence)
    if hop_sequence.is_a?(Hash)
      hop_sequence.first
    else
      ['left', hop_sequence]
    end
  end
end
