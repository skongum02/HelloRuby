class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :to
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
