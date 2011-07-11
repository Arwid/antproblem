class Fixnum
  def series_sum
    self * (self + 1) / 2
  end
end

class Array
  def map_with_index!
    each_with_index { |e, i| self[i] = yield(e, i) }
  end

  def map_with_index(&block)
    dup.map_with_index!(&block)
  end
end

class Block
  def initialize(size, dark=1)
    @size = size
    @dark = dark
  end
  def decrease
    @dark -= 1 if @dark > 0
  end
  def whitespace
    @dark <= @size ? @size*@size - @dark.series_sum : 0
  end
end

class BlockCollection
  def initialize(size)
    @size = size
    @struct = Array.new(size).map_with_index! { |row, r| Array.new(size)
      .map_with_index! {|col, c| Block.new(10, c + r + 1) } }
  end
  def decrease
    @struct.each { |row| row.each { |col| col.decrease } }
  end
  def whitespace
    total = 0
    @struct.each { |row| row.each { | col |
        colwhitespace = col.whitespace
        total += colwhitespace
      }}
    return total
  end
end

collection = BlockCollection.new 10
total = 0
7.times do |i|
  total +=  collection.whitespace * (7 - i)
  collection.decrease
end
puts total