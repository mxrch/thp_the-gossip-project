class RepliesController < ApplicationController
  before_action :set_reply, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Comment.find(params[:comment_id]).replies.new
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
  end

  def create
    print params
    @reply = Comment.find(params[:comment_id]).replies.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to gossip_comment_path(params[:gossip_id], params[:comment_id]) }
      end
    end
  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        puts "Je tente de rediriger"
        format.html { redirect_to gossip_comment_path(params[:gossip_id], @reply.comment_id) }
        puts "Voilà lol"
      end
    end
  end

  def destroy
    respond_to do |format|
      comment_id = @reply.comment_id
      if @reply.destroy
        format.html { redirect_to gossip_comment_path(params[:gossip_id], comment_id) }
      end
    end
  end

  private
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def reply_params
      puts "JE RENTRE DANS PARAMS"
      temp_params = params.require(:reply).permit(:anonymous_replier, :content, :gossip_id)
      puts "TEMP PARAMS FAIT"
      temp_params.merge!(user_id: session[:user_id])
      puts "TEMP PARAMS"
      print temp_params
      return temp_params
    end
end
