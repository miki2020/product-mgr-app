class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title


      #t.bigint  :product_id
      #t.string  :taggable_type
      #t.references :taggable, polymorfic: true

      t.timestamps
    end
    create_table :taggings do |t|
      t.belongs_to  :tag
      t.belongs_to  :product
      t.timestamps
    end
  end
end
