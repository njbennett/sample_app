class AddPasswordDigestToWriters < ActiveRecord::Migration[6.1]
  def change
    add_column :writers, :password_digest, :string
  end
end
