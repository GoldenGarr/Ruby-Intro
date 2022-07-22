class HashWithIndifferentAccess < Hash

  def [](key)
    self[key.is_a? Symbol ? key.to_s : key]
  end

end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess.new(self)
  end
end

h = { :a => 1, 'b' => 2 }.with_indifferent_access
p h
