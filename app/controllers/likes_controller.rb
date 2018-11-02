class LikesController < ApplicationController

  def create
    @like = Gossip.find(params[:gossip_id]).likes.new(gossip_id: params[:gossip_id], user_id: session[:user_id])

    respond_to do |format|
      if @like.save
        format.html { redirect_to gossip_path(params[:gossip_id]) }
      else

      end
    end
  end

  def destroy
  end

  private
    def set_like
      @comment = Comment.find(params[:id])
    end
end
