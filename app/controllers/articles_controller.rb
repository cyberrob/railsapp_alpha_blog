class ArticlesController < ApplicationController

	before_action :get_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params_check)

		if @article.save
			flash[:success] = "Post was successfully posted."
			redirect_to article_path(@article)
		else
			render :new
		end
	end

	def edit
		# @article = Article.find(params[:id])
	end

	def update
		# @article = Article.find(params[:id])

		if @article.update(article_params_check)
			flash[:success] = "Post was successfully updated."
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

	def show
		# @article = Article.find(params[:id])
	end

	def destroy
		# @article = Article.find(params[:id])
		@article.destroy

		flash[:danger] = "Post was successfully deleted."
		redirect_to articles_path
	end

	private
	def get_article
		@article = Article.find(params[:id])
	end

	def article_params_check
		params.require(:article).permit(:title, :description)
	end

end