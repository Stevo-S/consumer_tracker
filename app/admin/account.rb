ActiveAdmin.register Account do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  remove_filter :accounts_account_types

  permit_params :name, account_type_ids: [] 

  form do |f|
    f.inputs "Account Details" do
      f.input :name
      f.input :account_types, as: :check_boxes
    end

    f.actions
  end

  show do |account|
    attributes_table do
	row :name
	row :account_types do
	    account.account_types.each do |type|
		li type.name
	    end
	end
    end

    active_admin_comments
  end
end
