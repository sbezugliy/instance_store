# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InstanceStore do
  subject { raise(described_class.new(*args)) }

  shared_examples 'raises error' do |error_class, message|
    it do
      expect { subject }.to raise_error(
        error_class,
        message
      )
    end
  end

  describe described_class::NoModuleError do
    let(:args) { %i[model] }

    include_examples 'raises error',
                     InstanceStore::NoModuleError,
                     'Module `Model` is undefined'
  end

  context described_class::NoClassError do
    let(:args) {%i[model test_a]}

    include_examples 'raises error',
                     InstanceStore::NoClassError,
                     'Class `Model::TestA` is undefined'
  end

  describe described_class::NilAliasNameError do
    let(:args) {%i[model test_a]}

    include_examples 'raises error',
                     InstanceStore::NilAliasNameError,
                     'Alias name is nil for cloned `Model::TestA`.'
  end
end
