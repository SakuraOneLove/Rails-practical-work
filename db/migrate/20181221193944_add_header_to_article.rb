class AddHeaderToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :header, :string
  end
end
