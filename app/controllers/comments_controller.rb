class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @replies = Reply.all
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Gossip.find(params[:gossip_id]).comments.new
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
  end

  def create
    @comment = Gossip.find(params[:gossip_id]).comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to gossip_path(@comment.gossip_id) }
      end
    end
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to gossip_comment_path(@gossip, @comment.id) }
      end
    end
  end

  def destroy
    respond_to do |format|
      gossip_id = @comment.gossip_id
      if @comment.destroy
        format.html { redirect_to gossip_path(gossip_id) }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      temp_params = params.require(:comment).permit(:anonymous_commentator, :content)
      temp_params.merge!(user_id: session[:user_id])
      return temp_params
    end
end
