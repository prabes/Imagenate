# frozen_string_literal: true

class ImagesController < ApplicationController #:nodoc:
  def index
    @image = Image.all
  end

  def new
    @image = Image.new
  end
end
