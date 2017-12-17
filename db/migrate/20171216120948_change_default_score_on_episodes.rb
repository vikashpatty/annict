# frozen_string_literal: true

class ChangeDefaultScoreOnEpisodes < ActiveRecord::Migration[5.1]
  def change
    rename_column :episodes, :score, :score
    change_column_null :episodes, :score, true
    change_column_default :episodes, :score, nil

    rename_column :episodes, :avg_rating, :rating_avg

    add_column :works, :score, :float
    add_index :works, :score
  end
end
