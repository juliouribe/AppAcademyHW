class GraphNode
  def initialize(value)
    @value = value
    @neighbors = []
  end

  def []=(value)
    @neighbors = value
  end
end
