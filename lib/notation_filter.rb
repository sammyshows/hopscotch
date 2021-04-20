class NotationFilter
  def convert(notation)
    notation.map do |hops_array|
      hops_array.map { |hop| hop.include?("0") ? '' : hop }
    end
  end
end
