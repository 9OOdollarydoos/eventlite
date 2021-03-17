class AddUserRegistrationToEvent < ActiveRecord::Migration[6.1]
  def change
    create_table :event_registrations do |t|
      t.references :attendee, references: :user
      t.references :event
      t.timestamps
    end
  end
end
