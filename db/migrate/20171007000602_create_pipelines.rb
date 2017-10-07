class CreatePipelines < ActiveRecord::Migration[5.1]
  def change
    create_table :pipelines do |t|
      t.integer :pipeline_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
