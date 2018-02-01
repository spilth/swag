class HomeController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all.where(trackable_type: 'Recording').order(created_at: :desc)
  end
end
