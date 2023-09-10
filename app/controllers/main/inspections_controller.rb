class Main::InspectionsController < ApplicationController
  before_action :authenticate_main_user!
  before_action :lood_inspection_items, only: [ :edit, :update, :edit, :edit_destroy]
  before_action :lood_form_items, only: [:index, :show]

  def index
  end

  def create
    @new_inspection = current_main_user.inspections.build(strong_param_create_inspection)

    respond_to do |format|

      if @new_inspection.valid?
        if strong_param_create_google_api_alignment[:google_api_alignment] == "1"
          if DbTokenStore.new.load(current_main_user).nil?
            @new_inspection.errors_add_api_auth 
            format.js { render :error }
          else
            google_cal_object = GoogleApiCalendar.new(current_main_user.id, request)
            @new_inspection.items.each do |item|
              google_cal_object.addEvent(item.name,
                                          @new_inspection.name,
                                          item.do_day)  
            end
            @new_inspection.save
            format.js
          end
        else
          @new_inspection.save
          format.js
        end
      else
        format.js { render :error }
      end
    end
  end

  def show
    @inspection = @items[0].inspection
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

  def strong_param_destroy_inspection
    params.require(:inspection).permit(:id, :is_delete)
  end

  def strong_param_destroy_items
    params.require(:inspection).permit(items_attributes: [:id, :is_delete])
  end

  def lood_inspection_items
    @inspection = current_main_user.inspections.includes(:items).find(params[:id])
  end

  def lood_form_items
    @items = Item.includes(:inspection).where(user_id: current_main_user.id, 
                                              inspection_id: params[:id])
                                       .order( do_day: :asc)
    @form = Form::ItemCollection.new(items: @items)
  end

  def destroy_inspection_or_items
    if strong_param_destroy_inspection[:is_delete] == 1.to_s
      Inspection.destroy(strong_param_destroy_inspection[:id])
    else
      Form::ItemCollection.new(strong_param_destroy_items).destroy     
      Inspection.destroy(strong_param_destroy_inspection[:id]) if Item.where(inspection_id: strong_param_destroy_inspection[:id]).blank?
    end
  end
end
