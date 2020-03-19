class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_by_title_and_syllabus(params[:query])

      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.syllabus @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end

# USER ---> goes to the FORM --> write QUERY  -->
# QUERY GOES TO '/movies' --> FILTER THE DATA BY FORM DATA (QUERY)
# --> FILTER THE MOVIE DATA