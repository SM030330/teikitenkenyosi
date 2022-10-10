class Main::InspectionsController < ApplicationController
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
    params.require(:inspection).permit(:name, :comment, items_attributes: [:name, :do_day, :notice_day, :_destroy, :id])
  end
end
