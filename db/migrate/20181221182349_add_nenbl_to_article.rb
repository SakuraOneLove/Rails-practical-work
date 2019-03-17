class AddNenblToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :nenbl, :boolean
  end
end
