class Parser
  attr_accessor :row
  def initialize(row)
    @row = row
  end

  def question_ids
    row.headers.first.gsub('q','').split(' ')[1..-1].map(&:to_i)
  end

  def user_id
    row.first.first.split(' ').shift.gsub('u', '').to_i
  end

  def responses
    row.first.first.split(' ')[1..-1].map(&:to_i)
  end

  def create_responses
    question_ids.each_with_index do |qid, index|
      Response.create(
        question_id: qid,
        user_id: user_id,
        response: responses[index]
      )
    end
  end
end