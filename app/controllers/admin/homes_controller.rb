class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
  end

  def destroy
  end

end
