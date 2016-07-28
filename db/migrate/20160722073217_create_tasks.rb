class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :finish_time
      t.date :finished_at
      t.boolean :finished, default: false
      t.boolean :important, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
