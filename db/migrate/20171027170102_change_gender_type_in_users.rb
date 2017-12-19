class ChangeGenderTypeInUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.change :gender, :string
    end
  end
end
