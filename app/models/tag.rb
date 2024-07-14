class Tag < ApplicationRecord
  belongs_to :post

  def self.ransackable_attributes(auth_object = nil)
    ["name", "post_id"]
  end
end
