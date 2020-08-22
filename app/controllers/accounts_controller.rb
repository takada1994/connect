class AccountsController < ApplicationController
  before_action :login_required
  
  def show
    @menber = current_menber
  end

  def edit
  end
end
