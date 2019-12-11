class CreateReportFormApplicationJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :reports, :form_applications do |t|
      # t.index [:report_id, :form_application_id]
      # t.index [:form_application_id, :report_id]
    end
  end
end
