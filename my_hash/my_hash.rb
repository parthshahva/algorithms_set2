class MyHash
  @@pair_counter = 0
  def initialize
    @array = Array.new(64){[]}
  end

  def find_index(key)
    return key.hash % @array.size
  end

  def []=(key, value)
    exists = false
    if @array[find_index(key)] == []
      @array[find_index(key)] << [key, value]
    else
      @array[find_index(key)].each do |x|
        if x[0] == key
          exists = true
          x[1] = value
        end
      end
    end
    @array[find_index(key)] << [key, value] if exists == false
    @@pair_counter += 1 if exists == false
    checker
  end

  def [](key)
    if @array[find_index(key)] == []
      return nil
    else
    new = @array[find_index(key)].find { |x| x[0] == key }
    return new[1] if new != nil
    end
  end

  def rehash
    old_array = @array
    @array = Array.new(old_array.size*2){[]}
    old_array.each do |x|
      if x != []
      x.each do |y|
        self[y[0]]=y[1]
      end
    end
    end
  end

  def checker
    if @array.size == @@pair_counter * 2
      rehash
    end
  end
end
