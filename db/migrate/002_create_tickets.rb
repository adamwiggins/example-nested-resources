class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :attendee
      t.integer :event_id

      t.timestamps
    end

    create_table :events_tickets do |t|
      t.integer :ticket_id
      t.integer :event_id
    end
  end

  def self.down
    drop_table :tickets
  end
end
