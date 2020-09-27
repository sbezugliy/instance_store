# frozen_string_literal: true

# Mixin module for common methods
module CoreMixins
  # Transforms symbol or string to object constantized name
  def to_classname
    to_s.capitalize.gsub(/_(\w)/) { Regexp.last_match(1).upcase }
  end
end
