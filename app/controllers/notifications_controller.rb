class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  end
  
  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      flash[:notice] = "お知らせが投稿されました"
      redirect_to notifications_path
    else
      flash[:alert] = "お知らせの投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def notification_params
    params.require(:notification).permit(:employee_id, :title, :content)
  end
  
end
