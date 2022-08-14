class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string      "name",      null: false
      t.date        "do_day"
      t.date        "notice_day"
      t.boolean     "doing",     default: false
      t.timestamps
    end
  end
end
