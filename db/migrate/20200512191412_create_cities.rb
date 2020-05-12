class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.string :state
      # default values can help reduce errors and inform you quickly and simply if information is missing from an entry
      # default syntax:
      # t.#{data_type} :#{attribute_name}, default: #{default_value}
      t.integer :crimes_per_capita, default: 0

      t.timestamps
    end
  end
end
