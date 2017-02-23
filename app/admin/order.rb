ActiveAdmin.register Order do

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

  actions :index, :show

  config.batch_actions = false

  menu priority: 20

  index do
    column :order_uuid
    column :customer_name
    column :customer_mobile
    column "客户地址" do |order|
      order.order_address
    end
    column :status do |order|
      order.status_text
    end
    column :created_at
    actions
  end

  filter :order_uuid
  filter :customer_name
  filter :customer_mobile

  show title: :order_uuid do
    attributes_table do
      row :order_uuid
      row :comment
      row :customer_name
      row :customer_mobile
      row :created_at
      row "客户地址" do |order|
        order.order_address
      end
    end

    panel "订单历史" do
      table_for order.order_histories do
        column :created_at
        column :operation do |history|
          history.operation_text
        end
        column :operator
        column :comment
      end
    end
  end

  ### 彻底删除订单及历史记录
  action_item :full_destory, only: :show, if: proc { can? :full_destory, order } do
    link_to '彻底删除', full_destory_admin_order_path(order), method: :delete
  end

  member_action :full_destory, method: :delete do
    order_uuid = resource.order_uuid
    if resource.destroy
      resource.order_histories.destroy_all
      redirect_to admin_orders_path, notice: "已彻底删除订单#{order_uuid}及其历史记录!"
    else
      redirect_to admin_orders_path, alert: "删除订单#{order_uuid}及其历史记录不成功"
    end
  end
  ### END

end
