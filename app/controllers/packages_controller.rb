class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)

    if @package.save
      flash[:alert] = "Package created successfully"
      redirect_to packages_path
    else
      console
      flash[:alert] = "Package not created"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @package = Package.find(params[:id])
  end
  
  def update
    @package = Package.find(params[:id])
  
    Package.transaction do
      if @package.update(package_params)
        flash[:alert] = "Package updated successfully"
        redirect_to packages_path
      else
        flash[:alert] = "Package not updated"
        render :edit, status: :unprocessable_entity
      end
    end
  end  

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to packages_path, alert: 'Package deleted'
  end

  private

  def package_params
    params.require(:package).permit(:sender, :recipient, :content, :weight, :destination)
  end
end
