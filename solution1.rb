class Fixnum
  def series_sum()(self*(self+1)/2)end
end

#class SeriesSumHelper
#  def self.series_sum(n)(@cache=@cache||=Hash.new)&&(@cache[n]||@cache[n]=n.series_sum)end
#end

def block(n)((sum=100*(n-1).series_sum)&&(n..10).each_with_index{|num,i|sum+=num*(100-(i+1).series_sum)}&&(10-(n-1)..9).each_with_index{|num,i|sum+=num*(100-(10-i).series_sum)}&&sum)end
def blocks()((sum=0)&&(1..7).each{|i|sum+=block(i)*(8-i)}&&sum)end

puts blocks