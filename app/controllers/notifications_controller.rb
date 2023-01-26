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

  def show
    @notification = Notification.find(params[:id])
  end


  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_edit_params)
      flash[:notice] = "お知らせが編集されました"
      redirect_to notifications_path
    else
      flash[:alert] = "お知らせの投稿に失敗しました"
      render :edit
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      flash[:notice] = "お知らせが削除されました"
      redirect_to notifications_path
    else
      flash[:alert] = "お知らせの削除に失敗しました"
      redirect_to notifications_path
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:employee_id, :title, :content)
  end

  def notification_edit_params
    params.require(:notification).permit(:employee_id, :title, :content)
  end
  
end
