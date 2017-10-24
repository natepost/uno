class PipelinesController < ApplicationController
  before_action :find_pipeline, only:
                                  [:show, :edit, :update, :destroy]

  def index
    @pipelines = Pipeline.all.order("created_at DESC")
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

  def edit
  end

  def update
  if @pipeline.update(pipeline_params)
      redirect_to @pipeline
    else
      render 'edit'
    end
  end

  def destroy
    @pipeline.destroy
    redirect_to root_path
  end

  private

  def pipeline_params
    params.require(:pipeline).permit(:title, :description)
  end

  def find_pipeline
    @pipeline = Pipeline.find(params[:id])
  end
end
