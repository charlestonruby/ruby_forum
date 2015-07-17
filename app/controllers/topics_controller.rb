class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  private

  def set_topic
    @topic = Topic.find params[:id]
  end

  def topic_params
    params.require(:topic).permit(
      :title,
    )
  end

end
