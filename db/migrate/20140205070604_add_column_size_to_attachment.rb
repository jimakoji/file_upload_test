class AddColumnSizeToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :size, :integer
  end
end
