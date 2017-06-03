class List < ApplicationRecord
  belongs_to :account, :foreign_key => "month", optional: true
end
