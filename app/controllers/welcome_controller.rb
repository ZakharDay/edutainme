class WelcomeController < ApplicationController
  before_filter :get_images

  def ru
  end

  def en
  end

  private
    def get_images
      images = ["curve1.png", "curve2.png", "curve3.png", "curve4.png", "curve5.png"]
      number_of_subsections = 15
      image_repeat = (number_of_subsections * 1.0 / images.length).ceil
      @images = images.shuffle * image_repeat
    end
end
