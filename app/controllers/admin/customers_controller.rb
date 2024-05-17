class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
end
