require 'spec_helper'

describe RB::Hasher do
  subject (:hasher) do
    RB::Hasher.new
  end

  describe '#generate' do
    let(:input) { ['ee','rrr','q','','ttttt'] }
    let(:output) { 4177694326 }
    
    shared_examples 'returns the right hash value' do
      specify { expect(hasher.generate(input)).to eq output }
    end

    context 'when all values are lowercase' do
      it_behaves_like 'returns the right hash value'
    end

    context 'when all values are uppercase' do
      let(:input) { ['EE','RRR','Q','','TTTTT'] }
      it_behaves_like 'returns the right hash value'
    end

    context 'when values are uppercase and lowercase' do
      let(:input) { ['ee','RRR','Q','','ttttt'] }
      it_behaves_like 'returns the right hash value'
    end

    context 'when values have leading and/or trailing spaces' do
      let(:input) { [' ee','rrr',' q ','','ttttt  '] }
      it_behaves_like 'returns the right hash value'
    end

    context 'when a value is a single space' do
      let(:input) { ['ee','rrr','q',' ','ttttt'] }
      it_behaves_like 'returns the right hash value'
    end

    context 'when a value has a space in the middle' do
      let(:output) { 4106923319 }

      context 'when values have single space in the middle' do
        let(:input) { ['ee','rrr','q','','tt ttt'] }
        it_behaves_like 'returns the right hash value'
      end

      context 'when a value has multiple spaces in the middle' do
        let(:input) { ['ee','rrr','q','','tt   ttt'] }
        it_behaves_like 'returns the right hash value'
      end
    end # when has space in middle

  end
end
