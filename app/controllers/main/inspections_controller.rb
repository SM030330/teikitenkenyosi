class Main::InspectionsController < ApplicationController
  before_action :authenticate_main_user!
  before_action :lood_inspection_items, only: [:show, :edit, :update, :edit, :edit_destroy]

  def index
    @items = Item.includes(:inspection).where(user_id: current_main_user.id).order( do_day: :asc)
    @form = Form::ItemCollection.new(items: @items)
  end

  def create
    @new_inspection = current_main_user.inspections.build(strong_param_create_inspection)

    if @new_inspection.valid?
      if strong_param_create_google_api_alignment[:google_api_alignment] == "1"
        google_cal_object = GoogleApiCalendar.new(current_main_user.id, request)
        redirect_to google_cal_object.redirect_url if google_cal_object.redirect_url.present?
        @new_inspection.items.each do |item|
          google_cal_object.addEvent(item.name,
                                      @new_inspection.name,
                                      item.do_day)  
        end
        @new_inspection.save
      end
    end

    respond_to do |format|
      if @new_inspection.valid?        
        format.js
      else
        format.js { render :error }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @inspection.update(strong_param_update_inspection)
      redirect_to main_inspections_path, notice: "点検項目を更新しました"
    else
      render 'edit'
    end
  end

  def edit_destroy
  end

  def destroy
    destroy_inspection_or_items()
    lood_inspection_items()
    if @inspection.items.blank?
      Inspection.destroy(@inspection.id)
    end
    redirect_to main_inspections_path, notice: "点検項目を削除しました"
  end

  private
  def strong_param_create_inspection
    params.require(:inspection).permit(:name, :comment, items_attributes: [:name, :do_day, :notice_day, :user_id ])
  end

  def strong_param_create_google_api_alignment
    params.require(:inspection).permit(:google_api_alignment)
  end

  def strong_param_update_inspection
    params.require(:inspection).permit(:name, :comment, items_attributes: [:id, :name, :do_day, :notice_day, :user_id, :_destroy])
  end

  def strong_param_destroy_inspection_is_delete
    params.require(:inspection).permit(:is_delete)
  end

  def strong_param_destroy_items
    params.require(:inspection).permit(items_attributes: [:id, :is_delete])
  end

  def lood_inspection_items
    @inspection = current_main_user.inspections.includes(:items).find(params[:id])
  end

  def destroy_inspection_or_items
    if strong_param_destroy_inspection_is_delete == 1.to_s
      Inspection.destroy(params[:id])
    else
      @items = Form::ItemCollection.new(strong_param_destroy_items)
      @items.destroy
    end
  end
end
