class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :title
      t.string :sdesc
      t.string :filepath

      t.timestamps
    end
  end
end
