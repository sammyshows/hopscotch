require 'hop_converter'

describe HopConverter do
  # tests for cases where the hop_converter array consists of the same number
  it 'converts [1,1] to left2 left2' do
    hop_converter = HopConverter.new([1, 1])
    expect(hop_converter.output).to eq 'left2 left2'
  end

  it 'converts [1, 1, 1, 1] to left4 left4 left4 left4' do
    hop_converter = HopConverter.new([1, 1, 1, 1])
    expect(hop_converter.output).to eq 'left4 left4 left4 left4'
  end

  # tests for cases where the hop_converter array consists of different numbers

  # [1, 0, 1, 0] == 'left2 left2'
  # [1, 0, 0, 0] == 'left1'
  # [1, 0] == 'left1'

  it 'converts [1, 0, 1, 0] to left2 left2' do
    hop_converter = HopConverter.new([1, 0, 1, 0])
    expect(hop_converter.output).to eq 'left2 left2'
  end

  it 'converts [1, 0, 0, 0] to left1' do
    hop_converter = HopConverter.new([1, 0, 0, 0])
    expect(hop_converter.output).to eq 'left1'
  end

  it 'converts [1, 0] to left1' do
    hop_converter = HopConverter.new([1, 0])
    expect(hop_converter.output).to eq 'left1'
  end

  # tests for cases where the hop_converter is given a key-value pair

  # left: [1, 1] == 'left2 left2'
  # right: [1, 1] == 'right2 right2'

  # {
  #   left: [1, 1, 1, 1],
  #   right: [1, 0, 1, 0]
  # } == 'left4 left4 left4 left4
  # right2 right2
  # '

  # {
  #   left: [1,1,1,1],
  #   right: [1,0,1,0],
  # } == 'left4right2 left4 left4right2 left4'
end
