class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.string :sdesc
      t.string :filepath
      t.string :imagefilepath
      t.references :user, index: true
      t.references :license, index: true

      t.timestamps
    end
  end
end
