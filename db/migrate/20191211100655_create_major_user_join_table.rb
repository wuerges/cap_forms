class CreateMajorUserJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :majors do |t|
      # t.index [:user_id, :major_id]
      t.index [:major_id, :user_id]
    end
  end
end
