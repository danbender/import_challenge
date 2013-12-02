require 'csv'

desc "pass in file"
task import: :environment do
  CSV.foreach('db/sample.tsv', headers: true) do |row|
    parser = Parser.new(row)
    parser.create_responses
  end
end