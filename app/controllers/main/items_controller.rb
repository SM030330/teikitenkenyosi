class Main::ItemsController < ApplicationController
  def edit
  end
  
  def update_doing
    @form = Form::ItemCollection.new(items_collection_params)
    if @form.update
      redirect_to main_inspections_path, notice: "実行状態を更新しました"
    else
      flash.now[:alert] = "実行状態を更新に失敗しました"
      render main_inspection_path
    end
  end

  private

  def items_collection_params
      params.require(:form_item_collection)
            .permit(items_attributes: [:id, :name, :do_day, :notice_day, :doing, :user_id])
  end
end
