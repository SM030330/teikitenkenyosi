class Item < ApplicationRecord
  belongs_to :inspection, optional: true
end
