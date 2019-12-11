class FormApplication < ApplicationRecord
  belongs_to :semester
  belongs_to :form_template

  def to_s
    "#{semester.to_s} #{form_template.name}"
  end


  def gather_data(professor_id, offer_id, question_type)
    # should gather data for each professor, for each offer
    # for each question, count the number of answers
    # output a hash { question_id => results }
    # where results = ([labels], [count])

    # .where("question_type = ?", question_type)
    resp = Answer.joins("join form_submissions on answers.id = answer_id join questions on question_id = questions.id")
                  .where("form_application_id = ?", id)
                  .where("answer_type != 2")
                  .where("professor_id = ?", professor_id)
                  .where("offer_id = ?", offer_id)
                  .group(["question_id", "answer_id"])
                  .count("answer_id")

    return fix_data(resp)    
  end

  def gather_complete_data(question_type)
    # should gather data for the complete form
    # output a hash { question_id => results }
    # .where("question_type = ?", question_type)
    resp = Answer.joins("join form_submissions on answers.id = answer_id join questions on question_id = questions.id")
                  .where("form_application_id = ?", id)
                  .group(["question_id", "answer_id"])
                  .count("answer_id")
                  return fix_data(resp)
                  # .where("answer_type != 2")
  end

  def fix_data(resp)
    q_hash = {}
    
    for k,count in resp
      question_id, answer_id = k
      
      if ! q_hash[question_id]
        q_hash[question_id] = []
      end

      q_hash[question_id] << [answer_id, count]
    end

    result = {}
    for question_id, v in q_hash
      answers = Question.find(question_id).question_template.answers
      ids = answers.map(&:id)
      h_count = Hash[v]
      
      labels = answers.map(&:text)
      counts = ids.map  { |i| h_count[i] ? h_count[i] : 0 } 
      
      result[question_id] = [labels, counts.map {|v| v.to_f / counts.sum}, counts]
    end  

    return result
  end

end
