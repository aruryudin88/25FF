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
    @resource = model.create resource_params
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
  
  def render
    if @resource and @resource.errors.any?
      session[:resource_errors] = @resource.errors
      redirect_to action: :new
    else
      super
    end
  end
  
  def model
    request.path[%r(^/([^/]+).*$), 1].classify.constantize
  end
end
