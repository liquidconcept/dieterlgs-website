class CreateDates < ActiveRecord::Migration
  def up
     create_table :dates do |t|
      t.string :date
      t.integer :position
      t.timestamps
    end

    Application::Date.reset_column_information

    while Application::Date.count < 6
      Application::Date.create do |date|
        date.position = Application::Date.count
      end
    end
  end

  def down
    drop_table :dates
  end
end
