require 'spec_helper'
require 'csv'

describe 'import' do
  include_context 'rake'

  it 'finds the right file' do
    CSV.stub(:foreach)
    rake
    expect(CSV).to have_received(:foreach).with('db/sample.tsv', {headers: true})
  end

  it 'passes a row to the parser' do
    parser = stub(:parser).as_null_object
    row = stub(:row)
    CSV.stub(:foreach).and_yield(row)
    Parser.stub(:new).and_return(parser)
    rake
    expect(Parser).to have_received(:new).with(row)
  end

  it 'calls #create_responses on parser' do
    parser = stub(:parser)
    parser.stub(:create_responses)
    Parser.stub(:new).and_return(parser)
    rake
    expect(parser).to have_received(:create_responses).exactly(3).times
  end
end