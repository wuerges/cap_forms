class CreateProfessorOfferJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :professors, :offers do |t|
      # t.index [:professor_id, :offer_id]
      # t.index [:offer_id, :professor_id]
    end
  end
end
