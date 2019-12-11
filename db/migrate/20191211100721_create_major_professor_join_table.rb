class CreateMajorProfessorJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :majors, :professors do |t|
      # t.index [:major_id, :professor_id]
      t.index [:professor_id, :major_id]
    end
  end
end
