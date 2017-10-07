class PipelinesController < ApplicationController
  before_action :find_pipeline, only:
                                  [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @pipeline = Pipeline.new
  end

  def create
    @pipeline = Pipeline.new(pipeline_params)
  end

  private

  def pipeline_params
    params.requires(:pipeline).permit(:title, :description)
  end

  def find_pipeline
    @pipeline = Pipeline.find(params[:id])
  end
end
