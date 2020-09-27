# frozen_string_literal: true

module Serializer
  class TestB
    attr_accessor :instance_hash, :instance_string, :instance_classname

    def initialize(instance_hash: Hash[:key, 'value'], instance_string: 'string')
      @instance_hash = instance_hash
      @instance_string = instance_string
      @instance_classname = self.class
    end

    def call
      {
        instance_hash: @instance_hash,
        instance_string: @instance_string,
        instance_classname: @instance_classname
      }
    end
  end
end
