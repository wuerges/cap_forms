class FormApplication < ApplicationRecord
  belongs_to :semester
  belongs_to :form_template

  def to_s
    "#{semester.to_s} #{form_template.name}"
  end


  def gather_data(professor_id, offer_id)
    # should gather data for each professor, for each offer
    # for each question, count the number of answers
    # output a hash { question_id => [:professor_id, :offer_id, results] }
    # where results = ([labels], [count], [percentage])
  end

  def gather_complete_data
    # should gather data for the complete form
    # output a hash { question_id => results }
  end

end
