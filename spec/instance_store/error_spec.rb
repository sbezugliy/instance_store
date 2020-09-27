# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InstanceStore do
  shared_examples 'raises error' do |error_class, message, args|
    subject { raise described_class, *args }

    it do
      expect { subject }.to raise_error(
        error_class,
        message
      )
    end
  end

  describe described_class::NoModuleError do
    include_examples 'raises error',
                     described_class,
                     'Module `Model` is undefined',
                     [:model]
  end

  describe described_class::NoClassError do
    include_examples 'raises error',
                     described_class,
                     'Module Model::TestA is undefined',
                     [:model, :test_a]
  end

  describe described_class::NilAliasNameError do
    include_examples 'raises error',
                     described_class,
                     'Alias name is nil for cloned `Model::TestA`.',
                     [:model, :test_a]
  end
end
