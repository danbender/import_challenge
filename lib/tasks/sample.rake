require 'csv'

desc 'Playing with sample.tsv'

task sample: :environment do
  CSV.foreach('db/sample.tsv', headers: true) do |row|
    user_id = row[0].split(" ").shift.gsub("u", "").to_i
    headers = row.headers[0].split(" ")[1..-1]
    response = row[0].split(" ")[1..-1]
    response.each do |resp|
        resp.to_i
    end

    headers.each_with_index do |qid, index|
      Response.create(
        question_id: qid.gsub("q","").to_i,
        user_id: user_id,
        response: response[index]
      )
    end
  end
end