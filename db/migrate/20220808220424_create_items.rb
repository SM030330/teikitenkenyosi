class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string      "name",       null: false
      t.date        "do_day",     null: false
      t.date        "notice_day", null: false
      t.boolean     "doing",      default: false
      t.timestamps
    end
  end
end
