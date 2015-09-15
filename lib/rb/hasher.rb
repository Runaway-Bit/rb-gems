require "rb/hasher/version"
require 'murmurhash3'

module RB
  class Hasher

    def self.generate(*values)
      if values.count == 1
        first_value = values.first
        if first_value.is_a?(Hash)
          MurmurHash3::V128.str_hash(
            first_value.sort.map(&:last).join(' ').squeeze(' ').strip.upcase
          ).first(2).join('')
        else
          MurmurHash3::V128.str_hash(
            first_value.join(' ').squeeze(' ').strip.upcase
          ).first(2).join('')
        end
      else
        MurmurHash3::V128.str_hash(
            values.join(' ').squeeze(' ').strip.upcase
          ).first(2).join('')
      end
    end

  end
end
