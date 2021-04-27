class NotationFilter
  def convert(notation)
    notation.map do |hops_array|
      hops_array.map { |hop| hop ? hop : '' }
    end
  end
end
