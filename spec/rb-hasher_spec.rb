require_relative '../lib/rb/hasher.rb'

describe RB::Hasher do
  subject (:hasher) do
    RB::Hasher
  end

  describe '#generate' do
    let(:input) { ['ee','rrr','q','','ttttt'] }
    let(:output) { 2976159564274142586 }
    
    shared_examples 'returns the right hash value' do
      specify { expect(hasher.generate(*input)).to eq output }
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

    context 'when input is a hash' do
      let(:input) do 
        { 
          "first_name" => 'q', 
          "last_name" => '', 
          "address_line1" => 'ee',
          "address_line2" => 'rrr',
          "zip5" => 'ttttt'
        }
      end
      
       it 'sorts by key, hashes and returns the right value' do
        expect(hasher.generate(input)).to eq output
      end
    end

    context 'when input is more than one argument' do
      let(:arg1) { 'ee' }
      let(:arg2) { 'rrr' }
      let(:arg3) { 'q' }
      let(:arg4) { '' }
      let(:arg5) { 'ttttt' }
      it 'returns the right value' do
        expect(hasher.generate(arg1, arg2, arg3, arg4, arg5)).to eq output
      end
    end

    context 'when a value has a space in the middle' do
      let(:output) { 4599337293622677386 }

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
