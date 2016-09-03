ActiveAdmin.register Place do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :title, :description, :image

	form do |f|
		f.inputs do
			f.input :title
			f.input :description
			f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
		end
		f.actions
	end

	index do
		selectable_column
		id_column
		column :title do |place|
			link_to link.title, admin_place_path(place)
		end
		column :description
		column :image do |place|
			image_tag place.image.url(:thumb)
		end

		actions
	end

	show do
		attributes_table do
			row :title
			row :description
			row :image do |place|
				image_tag place.image.url(:medium)
			end
		end
		active_admin_comments
	end
end
