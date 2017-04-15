class Linked
	attr_accessor :head

def initialize(value)
	@head = Node.new(value)
end

def append(value)
	current = @head
	while current.next_node != nil
		current = current.next_node
	end
	current.next_node = Node.new(value)
end

def prepend(value)
	first = @head
	@head = Node.new(value, first)
end

def size
	current = @head
	counter = 1
	while current.next_node != nil
		counter+=1
		current = current.next_node
	end
	counter
end

def head
	@head.value
end

def tail
	current = @head
	while current.next_node != nil
		current = current.next_node
	end
	current.value
end

def at(index)
	if index <=0
		raise "Not Valid"
	elsif index > self.size - 1
		raise "Not Valid"
	end
	current = @head
	index.times { current = current.next_node }
	current.value
end

def pop
	current = @head
	while current.next_node.next_node != nil
		current = current.next_node
	end
	current.next_node.value, current.next_node = nil, nil
end

def contains?(value)
	current = @head
	contains = false
	while current.next_node != nil
		if current.value == value
			contains = true
		end
		current = current.next_node
	end
	if self.tail == value
		contains = true
	end
	contains
end

def find(data)
	if !self.contains?(data)
		return nil
	end
	current = @head
	index = 1
	while current.next_node != nil
		if current.value == data
			return index
		end
		current = current.next_node
		index += 1
	end
end

def isEmpty
	return true if @head == nil
end

def to_s
	current = @head
	while current.next_node != nil
		print current.value + " ->"
		current = current.next_node
	end
	print self.tail + " -> nil"
end

end


class Node
  attr_accessor :value, :next_node

	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

a = Linked.new("Hey")
a.append(", how")
a.append(' are')
a.append(' you?')
a.prepend("Hello, ")
p a
p a.size
a.prepend("I like you")
p a.size
p a.head
p a.tail
p a.at(3)
p a
a.pop
p a
p a.tail
p a.contains?("I like you")
p a.size
p a.find("I like you")
a.to_s