ActiveAdmin.register Product do

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

  config.batch_actions = false

  menu priority: 5

  permit_params :number, :name, :description, :price

  config.sort_order = 'number_asc'

  index do
    column :number do |product|
      link_to product.number, admin_product_path(product)
    end
    column :name
    column :description
    column :price
    actions do |product|
      item "Add", add_price_admin_product_path(product), method: :put if can? :add_price, product
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :number
      f.input :name
      f.input :price
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :number
      row :name
      row :price
      row :description
    end
    active_admin_comments
  end

  member_action :add_price, method: :put do
    resource.price = resource.price + 10
    resource.save
    redirect_to resource_path, notice: "Added!"
  end

end
