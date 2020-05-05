class AddSkillToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :second_skill, :string
  end
end
