class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :tags do |t|
      t.index [:"movie,_id", :tag_id]
      t.index [:tag_id, :"movie,_id"]
    end
  end
end
