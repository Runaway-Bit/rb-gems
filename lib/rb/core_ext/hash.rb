require 'murmurhash3'

module ToHash

  refine String do
    def hash
      MurmurHash3::V32.str_hash(self)
    end
  end

end
