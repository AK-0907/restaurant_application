class AccountActivationsController < ApplicationController
 
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in(user)
      flash[:success] = "アカウント作成が完了しました！"
      redirect_to user
    else
      flash[:danger] = "無効なリンクです"
      redirect_to root_url
    end
     
  end  
end
