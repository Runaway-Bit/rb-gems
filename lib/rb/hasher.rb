require "rb/hasher/version"
require 'murmurhash3'

module RB
  class Hasher

    def generate(values)
      MurmurHash3::V32.str_hash(values.join(' ').squeeze(' ').strip.upcase)
    end

  end
end
