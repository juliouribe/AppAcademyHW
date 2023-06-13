class GraphNode
  attr_accessor :value, :neighbors
  def initialize(value)
    @value = value
    @neighbors = []
  end

  def []=(value)
    @neighbors = value
  end
end

def bfs(starting_node, target_value)
  visited = []
  q = Queue.new
  starting_node.neighbors.each {|node| q.enq(node) }

  until q.empty?
    current_node = q.deq
    return current_node if current_node.value == target_value
    visited << current_node
    current_node.neighbors.each {|node| q.enq(node) if !visited.include?(node) }
  end
  nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
