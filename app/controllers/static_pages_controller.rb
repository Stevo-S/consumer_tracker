class StaticPagesController < ApplicationController
  def home
    @slides = MainSlide.all
  end
end
