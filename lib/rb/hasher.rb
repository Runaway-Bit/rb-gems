require "rb/hasher/version"
require_relative 'core_ext/hash.rb'

module RB
  class Hasher

  using ToHash

    def generate(values)
      values.join(' ').squeeze(' ').strip.upcase.hash
    end
  end
end
