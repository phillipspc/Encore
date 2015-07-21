class StaticPagesController < ApplicationController

  before_action :require_log_in, only: :root

  def root
  end

  def home
    render :home, {layout: 'home'}
  end

end
