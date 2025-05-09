class ApplicationController < ActionController::Base
  def restricted_index(model)
    if params[:field_name] && params[:value]
      return model.where(params[:field_name].to_sym => params[:value])
    else
      return model.all
    end
  end
end
