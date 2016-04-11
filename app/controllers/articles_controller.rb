class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  def index
    @articles = Article.all
    @xxx = 
    "I think that I shall never see
A poem lovely as a tree.

A tree whose hungry mouth is prest
Against the earth’s sweet flowing breast;

A tree that looks at God all day,
And lifts her leafy arms to pray;

A tree that may in Summer wear
A nest of robins in her hair;

Upon whose bosom snow has lain;
Who intimately lives with rain.

Poems are made by fools like me,
But only God can make a tree."
end

  def show
    @article = Article.find(params[:id])
  end
################################
  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end
#################################
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


##########################################
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
