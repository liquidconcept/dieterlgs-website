class CreatePrices < ActiveRecord::Migration
  def up
    create_table :prices do |t|
      t.text :amount_default
      t.text :amount_promo
      t.boolean :promo_active
      t.text :amount
      t.integer :position
      t.timestamps
    end

    Application::Price.reset_column_information

    while Application::Price.count < 7
      Application::Price.create! do |price|
        price.position = Application::Price.count

        case price.position
          when 0
            price.amount_default ||= '90 .-'
          when 1
            price.amount_default ||= '100 .-'
          when 2
            price.amount_default ||= '200 .-'
          when 3
            price.amount_default ||= '300 .-'
          when 4
            price.amount_default ||= '400 .-'
          when 5
            price.amount_default ||= '600 .-'
          when 6
            price.amount_default ||= '90 .-'
        end
      end
    end
  end

  def down
    drop_table :prices
  end
end


