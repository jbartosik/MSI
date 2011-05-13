class StopiensController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    hobo_index Stopien.user_is(current_user)
  end
end
