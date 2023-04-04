class Main::ItemsController < ApplicationController  
  def update_doing
    @form = Form::ItemCollection.new(items_collection_params)
    if @form.update_doing
      redirect_to main_inspections_path, notice: "実行状態を更新しました"
    else
      flash.now[:alert] = "実行状態を更新に失敗しました"
      render main_inspection_path
    end
  end

  private

  def items_collection_params
      params.require(:form_item_collection)
            .permit(items_attributes: [:id, :doing,])
  end
end
