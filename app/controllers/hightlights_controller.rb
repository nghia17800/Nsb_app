class HightlightsController < ApplicationController
  before_action :set_hightlight, only: [:edit, :update, :destroy]

  def index
    @q = Hightlight.ransack(params[:q])
    @hightlights = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  end

  def new
    @hightlight = Hightlight.new
  end

  def edit
  end

  def create
    @hightlight = Hightlight.new(hightlight_params)
    respond_to do |format|
      if @hightlight.save
        format.html { redirect_to hightlights_url, notice: 'Hightlight was successfully created.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @hightlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hightlight.update(hightlight_params)
        format.html { redirect_to hightlights_url, notice: 'Hightlight was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @hightlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hightlight.destroy
    respond_to do |format|
      format.html { redirect_to hightlights_url, notice: 'Hightlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hightlight
      @hightlight = Hightlight.find(params[:id])
    end

    def hightlight_params
      params.require(:hightlight).permit(:name, :video)
    end
end
