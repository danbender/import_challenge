require 'spec_helper'

describe Parser do
  let(:row) { stub(:row) }

  before(:each) do
    row.stub(:first).and_return(['u1 2 3 5'])
    row.stub(:headers).and_return(['u1 q1 q2 q3'])
  end

  describe 'initialize' do
    it 'stores a row' do
      parser = Parser.new(row)
      expect(parser.row).to eq(row)
    end
  end

  describe '#question_ids' do
    it 'returns the ids of questions' do
      parser = Parser.new(row)
      expect(parser.question_ids).to eq([1,2,3])
    end
  end

  describe '#user_id' do
    it 'returns the id of a user' do
      parser = Parser.new(row)
      expect(parser.user_id).to eq(1)
    end
  end

  describe '#responses' do
    it 'returns responses' do
      parser = Parser.new(row)
      expect(parser.responses).to eq([2, 3, 5])
    end
  end

  describe '#create_responses' do
    it 'create responses' do
      parser = Parser.new(row)
      parser.create_responses
      expect(Response.count).to eq(3)
    end

    it 'creates responses with the right attributes' do
      parser = Parser.new(row)
      parser.create_responses
      expect(Response.first.question_id).to eq(1)
      expect(Response.first.user_id).to eq(1)
      expect(Response.first.response).to eq(2)
    end
  end
end