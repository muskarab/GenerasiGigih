require_relative './test_helper'
require_relative '../integer_array_incrementer'

describe IntegerArrayIncrementer do
    it 'should return [1] when input is [0]' do
        integerarrayincrementer = IntegerArrayIncrementer.new
        array = integerarrayincrementer.increment([0])
        expect(array).to eq([1])
    end

    it 'should return [2] when input is [1]' do
        integerarrayincrementer = IntegerArrayIncrementer.new
        array = integerarrayincrementer.increment([1])
        expect(array).to eq([2])
    end

    it 'should return [1, 0] when input is [9]' do
        integerarrayincrementer = IntegerArrayIncrementer.new
        array = integerarrayincrementer.increment([9])
        expect(array).to eq([1, 0])
    end

    # it 'should return [1, 1] when input is [1, 0]' do
    #     integerarrayincrementer = IntegerArrayIncrementer.new
    #     array = integerarrayincrementer.increment([1, 0])
    #     expect(array).to eq([1, 1])
    # end
end