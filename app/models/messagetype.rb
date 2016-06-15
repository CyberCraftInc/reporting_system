class Messagetype < ActiveRecord::Base
  has_and_belongs_to_many :messages, dependent: :destroy
end
