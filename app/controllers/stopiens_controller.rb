class StopiensController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    hobo_index Stopien.user_is(current_user)
  end

  def create
    params[:stopien]['dopasowanie'].gsub!(',', '.')
    s = Stopien.new params[:stopien]

    if s.valid?
      s.save!
      swiat = s.swiat
    else
      swiat = params[:stopien]['swiat_id']
      flash[:notice] = "Błąd: #{s.errors.values.each{ |e| e}}"
    end

    if swiat.nil?
      redirect_to swiats_path
    else
      redirect_to swiat_path(swiat)
    end

  end

  index_action :export do
    response.content_type = 'text/plain'
  end
end
