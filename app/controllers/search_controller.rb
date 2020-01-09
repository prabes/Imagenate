# frozen_string_literal: true

class SearchController < ApplicationController #:nodoc:
  def create
    if params[:search].blank?
      flash[:alert] = 'No Search Keywords!'
      redirect_to root_path
    else
      @parameter = '%' + params[:search].downcase + '%'
      @results =
        Profile.where('lower(username) like :search', search: @parameter)
      render :create
    end
  end
end
