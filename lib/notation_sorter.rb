class NotationSorter
  def convert(notation)
    notation = notation.select { |hop| hop == 1 }
    notation.map { |hop| hop * notation.length }
  end
end
