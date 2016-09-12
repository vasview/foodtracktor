ActiveAdmin.register User do

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
permit_params :name, :email, :phone, :address, :password, :password_confirmation, :admin

	form do |f|
	  f.inputs do
	  	f.input :name
	  	f.input :email
	  	f.input :phone
	  	f.input :address
	  	f.input :current_sign_in_at
	  	f.input :last_sign_in_at
	  	f.input :current_sign_in_ip
	  	f.input :last_sign_in_ip
	  	f.input :admin
	  end
	  f.actions
	end  

	index do
		selectable_column
		id_column
		column :name do |user|
			link_to user.name, admin_user_path(user)
		end
		column :email
		column :phone
		column :current_sign_in_at
		column :last_sign_it_at
		column :current_sign_in_ip
		column :last_sign_in_ip
		column :admin

		actions
	end

	show do 
	    attributes_table do
			row :name
			row :email
			row :phone
			row :address
			row :created_at
			row :updated_at
			row :sign_in_count
			row :current_sign_in_at
			row :last_sign_it_at
			row :current_sign_in_ip
			row :last_sign_in_ip
			row :admin
		end
		active_admin_comments
	end

end
