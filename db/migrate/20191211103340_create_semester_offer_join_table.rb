class CreateSemesterOfferJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :semesters, :offers do |t|
      # t.index [:semester_id, :offer_id]
      # t.index [:offer_id, :semester_id]
    end
  end
end
