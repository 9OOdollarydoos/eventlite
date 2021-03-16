class AddUserRegistrationToEvent < ActiveRecord::Migration[6.1]
  def change
    create_table :event_registrations do |t|
      t.belongs_to :attendee, foreign_key: { to_table: :users }
      t.belongs_to :event
      t.timestamps
    end
  end
end
