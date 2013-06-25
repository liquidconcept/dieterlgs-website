class CreateDates < ActiveRecord::Migration
  def up
     create_table :dates do |t|
      t.string :date
      t.integer :order
      t.timestamps
    end

    Application::Date.reset_column_information

    while Application::Date.count < 6
      Application::Date.create do |date|
        date.order = Application::Date.count
      end
    end
  end

  def down
    drop_table :news
  end
end
