class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.jsonb :content, null: false, default: {}

      t.timestamps
    end
  end
end
