# frozen_string_literal: true

require 'spec_helper'
require_relative '../support/mock/test_a'
require_relative '../support/mock/test_b'

RSpec.describe InstanceStore::Instantiator do
  subject(:wm) { described_class.new(%i[model serializer]) }

  describe 'when classes exists' do
    before do
      wm.add(:model, :test_A)
      wm.add(:serializer, :test_B)
      wm.add(:model, :test_A, clone: true, alias_name: :test_A_clone)
    end

    it 'returns result' do
      expect(wm.get(:model, :test_A).call)
        .to eql({
                  instance_classname: Model::TestA,
                  instance_hash: { key: 'value' },
                  instance_string: 'string'
                })
      expect(wm.get(:serializer, :test_B).call)
        .to eql({
                  instance_classname: Serializer::TestB,
                  instance_hash: { key: 'value' },
                  instance_string: 'string'
                })
    end
  end

  describe 'when instantiating a clone of the instance' do
    before do
      wm.add(:model, :test_A)
      wm.add(:serializer, :test_B)
      wm.add(:model, :test_A, clone: true, alias_name: :test_A_clone)
    end

    context 'when alias is nil' do
      it 'raises InstanceStore::WMNilAliasNameError' do
        expect { wm.add(:model, :test_A, clone: true, alias_name: nil) }
          .to raise_error(
            InstanceStore::NilAliasNameError,
            'Alias name is nil for cloned `Model::TestA`'
          )
      end
    end

    context 'when alias is present' do
      let(:original_instance) { wm.get(:model, :test_A).call }
      let(:cloned_instance) { wm.get(:model, :test_A_clone).call }

      it 'returns result for original instance' do
        expect(original_instance)
          .to eql({
                    instance_classname: Model::TestA,
                    instance_hash: { key: 'value' },
                    instance_string: 'string'
                  })
      end

      it 'returns result for cloned instance' do
        expect(cloned_instance)
          .to eql({
                    instance_classname: Model::TestA,
                    instance_hash: { key: 'value' },
                    instance_string: 'string'
                  })
      end

      context 'with refined instance vars' do
        xit 'should ' do
        end
      end

      it 'classes of original and cloned instances are same' do
        expect(original_instance).to eql(cloned_instance)
      end

      it 'object_id of same instance is the same for few calls' do
        expect(original_instance)
          .to eql(wm.get(:model, :test_A).call)
      end

      it 'object ids of original and cloned instances are different' do
        expect(original_instance.object_id)
          .not_to eql(cloned_instance.object_id)
      end
    end
  end

  describe 'when arguments were provided' do
    before do
      wm.add(
        :model,
        :test_A,
        args: {
          instance_hash: { a: 'a', b: 'b' },
          instance_string: 'custom string'
        },
        clone: true,
        alias_name: :test_A_clone
      )
    end

    it 'returns result' do
      expect(wm.get(:model, :test_A).call)
        .to eql({
                  instance_classname: Model::TestA,
                  instance_hash: { a: 'a', b: 'b' },
                  instance_string: 'custom string'
                })
    end
  end

  describe 'when module is absent' do
    it 'raises InstanceStore::WMNoModuleError' do
      expect { wm.get(:controller, :test_A).call }
        .to raise_error(
          InstanceStore::NoModuleError,
          'Module controller is undefined'
        )
    end
  end

  describe 'when class is absent' do
    it 'raises InstanceStore::WMNoClassError' do
      expect { wm.get(:model, :test_C).call }
        .to raise_error(
          InstanceStore::NoClassError,
          'Class `Model::TestC` is undefined'
        )
    end
  end
end
