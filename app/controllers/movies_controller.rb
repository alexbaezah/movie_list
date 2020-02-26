class MoviesController < ApplicationController
    before_action :set_movie, only: [:edit, :update, :destroy, :delete, :show, :favorite, :add_tag, :movie_tag]

    def index 
        @movies = Movie.all 
    end

    def new 
        @movie = Movie.new
    end

    def create 
        @movie = Movie.new(movie_params)
        if @movie.save 
            redirect_to movies_path 
        else
            render('new')
        end
    end
    
    def edit 
    end

    def update 
        @movie.update(movie_params)
        redirect_to movies_path
    end

    def destroy 
        @movie.delete 
        redirect_to movies_path
    end

    def favorite
        @movie.update(favorite: true)
        redirect_to movies_path
    end

    def show 
       if @movie.favorite == true 
            @movie_done = "marcada como favorito"   
       else
            @movie_undone = "no ha sido marcada como favorito"
       end

    end

    def list 
     @movie_done = Movie.done 
     @movie_undone = Movie.undone
    end

    def add_tag 
        @movie.tags << Tag.new(name: params[:name])
    end

    def movie_tag
       @movie.tags.name
        
    end


    private 

    def movie_params 
     params.require(:movie).permit(:name, :age, :favorite)
    end

    def set_movie 
        @movie = Movie.find(params[:id])
    end

   

end
