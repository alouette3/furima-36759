class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  # before_action :move_to_root, only: :index

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_params)
    if @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path     
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # def move_to_root
  #   redirect_to root_path if Item.find(params[:item_id]).purchase_history.present?
  # end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
