class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[edit update destroy]
  before_action :set_form_option, only: %i[new create edit update]

  def index
    @employees = Employee.active.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)

    respond_to do |format|
      format.html
      time_now = Time.zone.now.strftime('%Y%m%d%H%M%S')
      format.csv { send_data render_to_string, filename: "employee_#{time_now}_list.csv", type: :csv }
    end
  end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params)

    # add_params

    if @employee.save
      redirect_to employees_url, notice: "社員「#{@employee.last_name} #{@employee.first_name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    # add_params

    if @employee.update(employee_params)
      redirect_to employees_url, notice: "社員「#{@employee.last_name} #{@employee.first_name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.zone.now
      @employee.update_column(:deleted_at, now)
      @employee.profiles.active.first.update_column(:deleted_at, now) if @employee.profiles.active.present?
    end

    redirect_to employees_url, notice: "社員「#{@employee.last_name} #{@employee.first_name}」を削除しました。"
  end

  private

  def employee_params
    params.require(:employee).permit(:number, :last_name, :first_name, :account, :email, :password, :date_of_joining, :department_id, :office_id, :employee_info_manage_auth, :notification_posting_authority)
  end

  def set_employee
    @employee = Employee.find(params["id"])
  end

  def set_form_option
    @departments = Department.all
    @offices = Office.all
  end

  # 現在、メールアドレスと入社日は入力できないため、ここで追加しています。
  # def add_params
  #   unless @employee.email
  #     @employee.email = 'sample@example.com'
  #   end
  #   unless @employee.date_of_joining
  #     @employee.date_of_joining = Date.today
  #   end
  # end

  def sort_column
    params[:sort] || 'number'
  end

  def sort_direction
    params[:direction] || 'asc'
  end
end
