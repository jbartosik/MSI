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
      rasa = s.rasa
    else
      rasa = params[:stopien]['rasa_id']
      flash[:notice] = "Błąd: #{s.errors.values.each{ |e| e}}"
    end

    if rasa.nil?
      redirect_to rasas_path
    else
      redirect_to rasa_path(rasa)
    end

  end

  index_action :export do
    response.content_type = 'text/plain'
  end
end
