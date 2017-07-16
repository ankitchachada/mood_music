class CreateMoods < ActiveRecord::Migration[5.1]
  def change
    create_table :moods do |t|
      t.text :input_url
      t.string :status
      t.text :output_url

      t.timestamps
    end
  end
end
