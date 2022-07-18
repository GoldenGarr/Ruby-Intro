class HashWithIndifferentAccess < Hash
  alias parent_hash []

  def initialize(constructor = {})
    if constructor.respond_to?(:to_hash)
      super()
      update(constructor)
    else
      super(constructor)
    end
  end

  def [](key)
    if self.key?(key.to_s)
      self.parent_hash(key.is_a?(Symbol) ? key.to_s : key)
    elsif self.key?(key.to_sym)
      self.parent_hash(key.is_a?(String) ? key.to_sym : key)
    end
  end

end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess.new(self)
  end
end

# module IndifferentHashUtil
#   def with_indifferent_access
#     HashWithIndifferentAccess.new(self)
#   end
# end
#
# Hash.include(IndifferentHashUtil)

h = { :a => 1, "b" => 2 }
h = h.with_indifferent_access
# h = HashWithIndifferentAccess.new({ :a => 1, 'b' => 2 })

# p h.is_a? HashWithIndifferentAccess

p h
# p Hash.new(h)

# # Regular
p h[:a]
p h["b"]

# # Indifference showcase
p h["a"]
p h[:b]

