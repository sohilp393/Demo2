class Article < ApplicationRecord
	belongs_to :user
	validates :title, presence:true ,length:{mininmum:3 ,maximum:50}
	validates :description, presence:true ,length:{mininmum:10 ,maximum:500}
    validates :user_id , presence:true

    has_many :comments
end