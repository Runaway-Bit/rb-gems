require 'spec_helper'

describe RB::Hasher do
  subject (:hasher) do
    RB::Hasher.new
  end

  describe '#generate' do
    let(:input) { ['ee','rrr','q','','ttttt'] }
    let(:output) { 4177694326 }

    context 'when all values are lowercase' do
      it 'returns the right hash value' do
        expect(hasher.generate(input)).to eq output
      end
    end

    context 'when all values are uppercase' do
      
      let(:input) { ['EE','RRR','Q','','TTTTT'] }

      it 'returns the right hash value' do
        expect(hasher.generate(input)).to eq output
      end
    end

    context 'when values are uppercase and lowercase' do
      
      let(:input) { ['ee','RRR','Q','','ttttt'] }

      it 'returns the right hash value' do
        expect(hasher.generate(input)).to eq output
      end
    end

    context 'when values have leading and/or trailing spaces' do
      
      let(:input) { [' ee','rrr',' q ','','ttttt  '] }

      it 'returns the right hash value' do
        expect(hasher.generate(input)).to eq output
      end
    end
  end
end
