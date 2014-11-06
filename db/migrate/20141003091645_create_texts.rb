class CreateTexts < ActiveRecord::Migration
  def up
    create_table :texts do |t|
      t.text :text
      t.integer :position
      t.timestamps
    end

    Application::Text.reset_column_information

    while Application::Text.count < 1
      Application::Text.create! do |text|
        text.position = Application::Text.count
      end
    end
  end

  def down
    drop_table :texts
  end
end
