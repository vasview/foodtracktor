class Dish < ActiveRecord::Base
	belongs_to :place

	validates :title, presence: true, 
				length: {maximum: 50}

	validates :description, length: {maximum: 250}

	validates :price, presence: true,
			   numericality: { greater_than_or_equal: 0 }

	has_attached_file :image,
				styles: {medium: '200x200>', thumb: '120x120>'},
				default_url: 'images/:style/missing.png'

	validates_attachment :image,
				content_type: {content_type: %w(image/jpg image/png image/gif) }
end
