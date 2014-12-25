class ItemsController < ApplicationController
  before_filter :find_item, only: [:show, :edit, :update, :destroy,:upvote]

  def index
    @items = Item
    @items = @items.where('price >= ?',params[:price_from])           if params[:price_from]
    @items = @items.where("created_at >=?", 1.day.ago)                if params[:today]
    @items = @items.where("votes_count >=?", params[:votes_from])     if params[:votes_from]
    @items =@items.order("votes_count DESC","price")
    # @items = Item.where('price >= ?',params[:price_from]).order("votes_count DESC","price").limit(50)
   # @items = Item.all
   #  render text:@items.map { |i| "#{i.name}:  #{i.price}"}.join("<br/>")
  end

  #This is a test method
  # def create
  #   @item = Item.create(params[:@item])
  #   p params
   # @item  = Item.create(name: params[:name],descriptions: params[:descriptions], price: params[:price],real:params[:real],weight:params[:weight])
   #  render text: "#{@item.id}: #{@item.name}(#{@item.new_record?})"
  # end

  # /items POST
  def create

     @item = Item.create(ad_params)
     if @item.errors.empty?
        redirect_to item_path(@item)
      # render "items/show"
     else
       render "items/new"
     end
     # render text: params.inspect
  end

  # /items/1 GET
  def show
   if @item = Item.where({id:params[:id]}).first
    render "items/show"
    else
     render text: "Page not found 404", status: 404
   end
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  # /items/1 PUT
  def update
    # @item = Item.find(params[:id])
    @item.update_attributes(ad_params)
    if @item.errors.empty?
      flash[:success] = "Item successfully updated!"
      redirect_to item_path(@item)
      # render "items/show"
    else
      flash.now[:error] = 'You made mistakes in your form! Correct your form!'
      render "items/edit"
    end
  end

  #/items/1/edit GET
  def edit
    # @item = Item.find(params[:id])
  end

  #/items/new GET
  def new
    @item  = Item.new
  end

  # /items/1 DELETE
  def destroy
    # @item = Item.find(params[:id])
    @item.destroy
    # render json: { success: true }
    ItemsMailer.item_destroyed(@item).deliver
    redirect_to action: "index"

  end

  def expensive
    @items = Item.where("price>5000")
    render "index"
  end

  private
  def find_item
    # @item = Item.find(params[:id])
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end


  def ad_params
    params.require(:item).permit(:name, :price, :descriptions,:category_id, :weight,:avatar)
  end


end
