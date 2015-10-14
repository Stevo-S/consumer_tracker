class StaticPagesController < ApplicationController
  def home
    @slides = MainSlide.all
  end

  def faceboot
  end

  def trinity
  end
end
