class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.binary :content,    :null => false, limit: 10.megabytes
      t.string :name,       :null => false
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
  end
end
