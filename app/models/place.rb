class Place < ActiveRecord::Base
	has_many :dishes

	has_attached_file :image,
				styles: {medium: '200x200>', thumb: '120x120>'},
				default_url: 'images/styles:/missing.png'
	validates_attachment_content_type :image,
				content_type: ['image/jpg', 'image/png', 'image/gif']

	validates :title, presence: true, length: {maximum: 50}
	validates :description, length: {maximum: 250}
end
