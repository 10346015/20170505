class ListsController < ApplicationController
  
  before_action :load_account
  before_action :find_list, only:[:edit, :update, :destroy]
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end
  
  def show
  end
  
  def create
    @list = List.new(list_params)

      if @list.save
        redirect_to account_lists_path(@account)
      else
        render 'new'
      end
  end
  
  def edit
    
  end

  def update

    if @list.update(list_params)
      redirect_to account_lists_path(@account), notice: "updated!"
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @list.destroy
    redirect_to account_lists_path(@account) , notice: "deleted!"
  end
  
  private
    def list_params
      params.require("list").permit(:date,:item,:cost,:kind,:month)
    end
  
    def find_list
      @list = List.find_by(id: params[:id])
      redirect_to account_lists_path(@account) , notice: "no data!" if @list.nil?
    end
    
    def load_account
      if Account.exists?(id: params[:account_id])
        @account = Account.find(params[:account_id])
      else
        @account= Account.new
      end
    end
  
end
