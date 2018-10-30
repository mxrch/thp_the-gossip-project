class GossipsController < ApplicationController
  def single_gossip
    @gossip = Gossip.find(params[:id])
  end
end
