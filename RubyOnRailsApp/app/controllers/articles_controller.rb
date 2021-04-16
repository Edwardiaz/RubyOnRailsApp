class ArticlesController < ApplicationController
    #before_action :find_article, only: [:show, :edit, :update, :destroy, :from_author]
    before_action :find_article, except: [:new, :create, :index, :from_author]
    before_action :authenticate_user!, only: [:new, :show, :create, :edit, :update, :destroy]

    def index
        @article = Article.all
    end

    def new
        #Cuando una variable se le pone @ este se puede acceder desde la vista, sino solo se podra acceder desde el mismo controlador
        @article = Article.new 
        #@article.title = 'Demo'
    end

    def create #el article dentro de los [] hace referencia al objeto referenciado en el HTML
        #Hay varias formas de guardar un registro y asignarle un usuario:

        #forma 1
        #@article = Article.create(title: params[:article][:title],
        #                          content: params[:article][:content],
        #                          user: current_user)
        
        #Forma 2: este el problema es que puede que lo guarde dos veces... falta test
        #@article = Article.create(title: params[:article][:title],
        #                          content: params[:article][:content])
        #@article.user = current_user
        #@article.save
        
        #forma 3
        #@article = current_user.articles.create(title: params[:article][:title],
         #                                       content: params[:article][:content])
        
        @article = current_user.articles.create(article_params)
        @categories = Category.all
        @article.save_categories
        #render json: @article # Esto sirve para ver el json creado
        redirect_to @article
    end

    def show
    end 

    def edit
    end

    def update
        #@article.update(title: params[:article][:title],
        #                content: params[:article][:content])
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def destroy  
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])  
    end

    def article_params
        params.require(:article).permit(:title, :content, :category_elements)
    end
end
