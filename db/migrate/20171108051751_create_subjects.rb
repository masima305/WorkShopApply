class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|

      t.string :subname
      t.string :subteacher
      t.integer :sublimitone
      t.integer :sublimittwo
      t.integer :substudentone, default: 0
      t.integer :substudenttwo, default: 0
      t.string :subimg
      t.string :subcontent
      
      t.timestamps null: false
    end
  end
end
