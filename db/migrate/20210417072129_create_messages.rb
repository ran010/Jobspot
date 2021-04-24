class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :seeker, index: true
      t.belongs_to :recuitor, index: true
      t.timestamps
    end
  end
end
