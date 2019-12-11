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

    resp = Answer.joins("join form_submissions on answers.id = answer_id join questions on question_id = questions.id")
                  .where("form_application_id = ?", id)
                  .where("question_type = ?", question_type)
                  .where("answer_type != 2")
                  .where("professor_id = ?", professor_id)
                  .where("offer_id = ?", offer_id)
                  .group(["question_id", "answer_id"])
                  .count("answer_id")

    return fix_data(resp)    
  end

  def gather_complete_data
    # should gather data for the complete form
    # output a hash { question_id => results }
    resp = Answer.joins("join form_submissions on answers.id = answer_id join questions on question_id = questions.id")
                  .where("form_application_id = ?", id)
                  .where("question_type = ?", question_type)
                  .where("answer_type != 2")
                  .group(["question_id", "answer_id"])
                  .count("answer_id")
    return fix_data(resp)
  end

  def fix_data(resp)
    for k,count in resp
      question_id, answer_id = k
      if ! result[question_id]
        result[question_id] = [[],[]]
      end
      result[question_id][0] << answer_id
      result[question_id][1] << count
    end
    return result
  end

end
