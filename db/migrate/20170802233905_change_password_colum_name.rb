class ChangePasswordColumName < ActiveRecord::Migration[5.1]
  def change
    rename_column  :users, :password, :password_digest
  end
end

# this needs to be done so that bycrypt will work
