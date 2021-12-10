class ApartmentBill < ApplicationRecord
  belongs_to :apartment
  belongs_to :bill
end
