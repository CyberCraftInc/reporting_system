class RolesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @roles = Role.all
  end

  def show
    if @role.users.length == 0
      @assosciated_users = "None"
    else
      @assosciated_users = @role.users.map(&:name).join(", ")
    end
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def role_params
      params.require(:role).permit(:name)
    end
end
