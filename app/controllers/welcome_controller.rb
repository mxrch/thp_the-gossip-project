class WelcomeController < ApplicationController
  def hello
    @first_name = params[:first_name]
  end
end
