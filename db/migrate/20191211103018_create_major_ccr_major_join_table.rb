class CreateMajorCcrMajorJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :majors, :ccrs do |t|
      # t.index [:major_id, :ccr_id]
      # t.index [:ccr_id, :major_id]
    end
  end
end
