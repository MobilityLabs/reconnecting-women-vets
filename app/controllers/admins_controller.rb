class AdminsController < ApplicationController
  layout 'admin'

  def index
    @admins = Admin.order(:email).to_a
  end

  def confirm
    @admin = Admin.find(params[:id])
    if @admin.confirm!
      respond_to do |format|
        format.html { redirect_to admins_path, notice: 'Confirmed!'}
        format.js
      end
    else
      redirect_to @admin
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.id == current_admin.id
      redirect_to admins_path, notice: 'You cannot delete yourself!'
    elsif @admin.destroy
      respond_to do |format|
        format.html { redirect_to admins_path, notice: 'Admin deleted!' }
        format.js   {}
      end
    else
      respond_to do |format|
        format.html { redirect_to admins_path, alert: 'Delete failed! Try again.' }
        format.js   {}
      end
    end
  end

end
