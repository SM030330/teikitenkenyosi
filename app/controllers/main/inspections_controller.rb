class Main::InspectionsController < ApplicationController
  before_action :authenticate_main_user!

  def index
    @items = Item.includes(:inspection).where(user_id: current_main_user.id).order( do_day: :asc)
    @form = Form::ItemCollection.new(items: @items)
  end

  def create
    @inspection = current_main_user.inspections.build(strong_param_create_inspection)
    respond_to do |format|
      if @inspection.valid?
        @inspection.save
        format.js
      else
        format.js { render :error }
      end
    end
  end

  def show
    @inspection = current_main_user.inspections.includes(:items).find(params[:id])
  end

  def edit
    @inspection = current_main_user.inspections.includes(:items).find(params[:id])
  end

  def update
    @inspection = current_main_user.inspections.includes(:items).find(params[:id])
    if @inspection.update(strong_param_update_inspection)
      redirect_to main_inspections_path, notice: "点検項目を更新しました"
    else
      render 'edit'
    end
  end

  def delete
    
  end

  private
  def strong_param_create_inspection
    params.require(:inspection).permit(:name, :comment, items_attributes: [:name, :do_day, :notice_day, :user_id ])
  end

  def strong_param_update_inspection
    params.require(:inspection).permit(:name, :comment, items_attributes: [:id, :name, :do_day, :notice_day, :user_id, :_destroy])
  end

end
