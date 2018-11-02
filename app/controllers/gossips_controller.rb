class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all
  end

  def new
    @gossip = Gossip.new
  end

  def edit
  end

  def create
    print params
    @gossip = Gossip.new(gossip_params)

    respond_to do |format|
      if @gossip.save
        format.html { redirect_to gossip_path(@gossip.id) }
      end
    end
  end

  def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to gossip_path(@gossip.id) }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @gossip.destroy
        format.html { redirect_to gossips_path }
      end
    end
  end

  private
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    def gossip_params
      temp_params = params.require(:gossip).permit(:anonymous_author, :content)
      temp_params.merge!(user_id: session[:user_id])
      return temp_params
    end

end
