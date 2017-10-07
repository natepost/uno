class PipelinesController < ApplicationController
  before_action :find_pipeline, only:
                                  [:show, :edit, :update, :destroy]

  def index
    @pipeline = Pipeline.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pipeline = Pipeline.new
  end

  def create
    @pipeline = Pipeline.new(pipeline_params)

    if @pipeline.save
      redirect_to @pipeline, notice: "Successfully created new pipeline!"
    else
      render 'new'
    end
  end

  private

  def pipeline_params
    params.require(:pipeline).permit(:title, :description)
  end

  def find_pipeline
    @pipeline = Pipeline.find(params[:id])
  end
end
