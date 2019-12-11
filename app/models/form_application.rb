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
    # where results = ([labels], [count], [percentage])

    resp = Answer.joins("join form_submissions on answers.id = answer_id join questions on question_id = questions.id")
                  .where("form_application_id = ?", id)
                  .where("question_type = ?", question_type)
                  .where("answer_type != 2")
                  .where("professor_id = ?", professor_id)
                  .where("offer_id = ?", offer_id)
                  .group(["question_id", "answer_id"])
                  .count("answer_id")

    result = {}

    # FormSubmission.joins("join questions q on question_id = q.id join answers a on answer_id = a.id").where("form_application_id = ?", 1).where("professor_id = ?", 1).where("a.answer_type != '2'").where("offer_id = ?", 1).where("question_id = ?", 1).group("answer_id")
    # FormSubmission.joins("join questions q on question_id = q.id join answers a on answer_id = a.id").select("answer_id, count(answer_id) as count, a.text").where("form_application_id = ?", 1).where("professor_id = ?", 1).where("a.answer_type != '2'").where("offer_id = ?", 1).where("question_id = ?", 1).group("answer_id")
    # Answer.joins("join form_submissions on answers.id = answer_id join questions on question_id = questions.id").select("answers.id, count(answers.id), answers.text").where("form_application_id = 1").where("question_type = 0").where("answer_type != 2").where("professor_id = 1").where("offer_id = 1").where("question_id = 1").group("answer_id")
  end

  def gather_complete_data
    # should gather data for the complete form
    # output a hash { question_id => results }
  end

end
