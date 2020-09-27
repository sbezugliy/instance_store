# frozen_string_literal: true

module InstanceStore
  # Error for absent module
  class NoModuleError < StandardError
    def initialize(module_name, message = nil)
      msg = message || "Module #{module_name} is undefined"
      super(msg)
    end
  end

  # Error for absent class
  class NoClassError < StandardError
    def initialize(module_name, class_name, message = nil)
      msg = message || "Class `#{module_name.to_classname}::#{class_name.to_classname}` is undefined"
      super(msg)
    end
  end

  # Error for nil alias name
  class NilAliasNameError < StandardError
    def initialize(module_name, class_name, message = nil)
      msg = message || "Alias name is nil for cloned\
  `#{module_name.to_classname}::#{class_name.to_classname}`"
      super(msg)
    end
  end
end
