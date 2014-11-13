class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @orders = current_user.orders.where(payment_mode: [nil, ""])
  end

  def new
    @order = current_user.orders.new
  end

  def edit
  end

  def create
    @order = current_user.orders.create(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order.product, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order.product, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def pay
    orders = current_user.orders.where(payment_mode: [nil, ""])

    @order = nil
    if orders.length > 0
      orders.each do |order|
        order.payment_mode = params[:payment_mode]
        order.save
      end
      @order = orders.first
    end

    respond_to do |format|
      format.json { render :pay, status: :created, location: @order }
    end
  end

  private
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:amount, :product_id, :payment_mode)
    end
end