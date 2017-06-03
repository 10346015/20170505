class AccountsController < ApplicationController
  
  before_action :find_account, only:[:edit, :update, :destroy]
  
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end
  
  def show
  end
  
  def create
    @account = Account.new(account_params)

      if @account.save
        redirect_to accounts_path
      else
        render 'new'
      end
  end
  
  def edit
    
  end

  def update

    if @account.update(account_params)
      redirect_to accounts_path, notice: "updated!"
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @account.destroy
    redirect_to accounts_path , notice: "deleted!"
  end
  
  private
    def account_params
      params.require("account").permit(:month,:limitation)
    end
  
    def find_account
      @account = Account.find_by(id: params[:id])
      redirect_to accounts_path , notice: "no data!" if @account.nil?
    end
end
