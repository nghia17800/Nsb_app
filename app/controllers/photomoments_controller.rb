class PhotomomentsController < ApplicationController
  def new
    @photomoment = Photomoment.new
  end

  def create
    @photomoment = Photomoment.new(photomoment_params)
    if @photomoment.save
      flash[:success] = "Create photomoment success!"
      redirect_to photomoments_path
    else
      flash[:danger] = "The data entry is missing!"
      render :new
    end
  end

  def edit
    @photomoment = Photomoment.find(params[:id])
  end

  def update
    @photomoment = Photomoment.find(params[:id])
    if @photomoment.update(photomoment_params)
      flash[:success] = "Profile updated"
      redirect_to photomoments_path
    else
      render 'edit'
    end
  end
  def index
    @q = Photomoment.ransack(params[:q])
    @photomoments = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end

  private

  def photomoment_params
    params.require(:photomoment).permit(:name, :image)
  end

end
