class CreateMovies < ActiveRecord::Migration[8.1]
  def up
    create_table 'movies' do |t|
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'
      t.timestamps # created_at / updated_at
    end
  end

  def down
    drop_table 'movies'
  end
end
