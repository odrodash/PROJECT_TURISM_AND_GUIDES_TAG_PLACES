class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homeguides]

  def home
    if params[:query].present?
      sql_query = " \
        places.place @@ :query \
        OR places.country :query \
        OR guides.guide_name @@ :query \
        OR guides.first_name @@ :query \
        OR guides.last_name @@ :query \
      "
      @places = Place.joins([:guide, :place]).where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def homeguides
  end
end
