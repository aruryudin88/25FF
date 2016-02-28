class ResourcesController < ApplicationController
  def index
    @resources = model.all
  end

  def show
  end

  def new
    @resource_errors = session[:resource_errors]
    @resource = if @resource_errors
      session.delete :resource_errors
      resource_errors_base = @resource_errors.instance_variable_get(:@base)
      model.new resource_errors_base.presentative_attributes
    else
      model.new
    end
  end

  def create
    @resource = model.create_with_attachments resource_params
    if @resource.valid?
      flash[:notice] = t("controllers.#{model.name.tableize}.#{__method__}")
    else
      session[:resource_errors] = @resource.errors
    end
    redirect_to action: :new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def resource_params
    params[model.name.downcase].permit(model.presentative_attribute_names)
  end
  
  def model
    request.path[%r(^/([^/]+).*$), 1].classify.constantize
  end
end
