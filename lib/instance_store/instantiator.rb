# frozen_string_literal: true

module InstanceStore
  # Instantiator and loader
  class Instantiator
    attr_reader :types
    attr_accessor :i

    def initialize(types = [:Config])
      @i = {}
      @types = types
      build_storage
    end

    def types=(types)
      @types = types
      build_storage
    end

    def build_storage
      @i.merge! Hash[@types.map { |t| [t, @i[t] || {}] }]
    end

    def add(type, name, args: {}, clone: false, alias_name: nil)
      alias_check(type, name, clone, alias_name)
      inst = select_instance(type, name, args)
      @i[type][alias_name] = inst.clone if clone
    end

    def get(type, name)
      caller_check(type, name)
      @i[type][name]
    end

    private

    def select_instance(type, name, args)
      @i[type][name] unless @i[type].nil? || @i[type][name].nil?
      @i[type][name] = instantiate(type, name, args)
    end

    def alias_check(type, name, clone, alias_name)
      return unless clone
      return unless alias_name.nil?

      raise InstanceStore::NilAliasNameError.new(type, name)
    end

    def caller_check(type, name)
      raise(InstanceStore::NoModuleError, type) unless @i.keys.include?(type)
      raise(InstanceStore::NoClassError.new(type, name)) unless @i[type].keys.include?(name)
    end

    def instantiate(type, name, args)
      klass = eval_module(type).class_eval(name.to_classname)
      if args.empty?
        klass.new
      else
        klass.new(**args)
      end
    end

    def eval_module(type)
      Object.class_eval(type.to_classname)
    end
  end
end
