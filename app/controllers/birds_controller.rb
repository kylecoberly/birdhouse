class BirdsController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @birds = Bird.all

    render json: { birds: @birds }
  end

  def create
    @bird = Bird.create(
      species: params[:species],
      color: params[:color],
    )

    render json: { bird: @bird }
  end
end


if (@some_blog_post.author_id == @user.id)
  @some_blog_post.destroy
end
