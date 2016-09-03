ActiveAdmin.register Dish do

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

permit_params :title, :description, :price, :image, :place_id

	form do |f|
		f.inputs do 
			f.input :place
			f.input :title
			f.input :description
			f.input :price
			f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
		end
		f.actions
	end

	index do 
		selectable_column
		id_column
		column :title do |dish|
			link_to dish.title, admin_dish_path(dish)
		end
		column :place
		column :description
		column :price
		column :image do |dish|
			image_tag(dish.image.url(:medium))
		end
		actions
	end

	show do
		attributes_table do
			row :title
			row :place
			row :description
			row :price
			row :image do |dish|
				image_tag(dish.image.url(:medium))
			end
		end
		active_admin_comments
	end
end
