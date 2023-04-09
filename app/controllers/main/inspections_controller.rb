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

  private
  def strong_param_create_inspection
    params.require(:inspection).permit(:name, :comment, items_attributes: [:name, :do_day, :notice_day, :user_id, :_destroy])
  end
end
