class GroupsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :load_group, only: [:update, :destroy, :edit]

  respond_to :js, only: :destroy

  def index
    respond_with(@groups = Group.all)
  end

  def create
    respond_with(@product = Group.create(group_params))
  end

  def new
    respond_with(@group = Group.new)
  end

  def destroy
    respond_with(@group.destroy)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def show
    redirect_to groups_path
  end

  def edit
    respond_with @group
  end

  private

    def load_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :id)
    end
end
