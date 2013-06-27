class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_admin!

  def home
  end

  def contact_us
  end

  def demonstration
  end

  def strategy
  end
end
