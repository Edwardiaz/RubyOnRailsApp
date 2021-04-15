class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    
    def index
        @articles = Article.all
    end

    def article
        #Cuando una variable se le pone @ este se puede acceder desde la vista, sino solo se podra acceder desde el mismo controlador
        @article = Article.new 
        @article.title = 'DemoOOOOOOOOOOOOOOOOOOOOOOOO'
    end

    def create #el article dentro de los [] hace referencia al objeto referenciado en el HTML
        @article = Article.create(title: params[:article][:title],content: params[:article][:content])
        render json: @article
    end

    def show
       
    end 

    def edit
        
    end

    def update
    
        @article.update(title: params[:article][:title],content: params[:article][:content])
        redirect_to @article
    end

    def destroy
       
        @article.destroy
        redirect_to root_path
    end

    def find_article
        puts "ESTOY EN FIND ARTICLE"
        @article = Article.find(params[:id])  
    end
end
