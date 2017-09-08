class Stack
  def initialize
    @stack=[]
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end
end

class Queue
  def initialize
    @queue=[]
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    p @queue
  end
end

class Map
  def initialize
    @map=[]
  end

  def assign(key, value)
    if self.lookup(key) == nil
      @map << [key, value]
    else
      @map[self.lookup(key)] = [key, value]
    end
  end

  def lookup(key)
    @map.each.with_index do |pair, idx|
      return idx if pair[0]==key
    end
    return nil
  end

  def remove(key)
    @map.each.with_index do |pair, idx|
      @map.delete_at(idx) if pair[0]==key
    end
  end

  def show
    p @map
  end
end

mappy=Map.new
mappy.assign("a", 1)
mappy.assign("b", 2)
mappy.assign("c", 3)
mappy.show
mappy.assign("a", 100)
mappy.show
