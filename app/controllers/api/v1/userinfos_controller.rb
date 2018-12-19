class Api::V1::UserinfosController < ApplicationController
  before_action :authenticate_user!

  def is_admin
    render json: {is_admin: current_user.admin}
  end
end