module Set2
  def self.find_intersection(array1, array2=[], array3=[])
    hash = Hash.new(0)
    array1.each {|x| hash[x] += 1 if array2.include?(x)&&array3.include?(x)}
    hash.select{|x,y| y > 0}.keys

  end
  def self.find_first_dup(array)
    hash = Hash.new(0)
    array.each{|x| hash[x] += 1}
    hash.select{|x,y| y > 1}.keys.first
  end
  def self.find_mode(array)
      hash = Hash.new(0)
      array.each{|x| hash[x] += 1}
      mode = nil
      mode_count = 1
      hash.each do |x,y|
        if hash[x] > mode_count
          mode_count = hash[x]
          mode = x
        end
      end
      return mode
  end
end
