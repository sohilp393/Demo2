class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)		
		@comment.user = current_user
		if @comment.valid?
 			@comment.save
 			redirect_to article_path(@article)
 		else
 			flash[:success] = "Something went wrong" 
 			redirect_to article_path(@article)
 			#render 'new'
 		end		
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to article_path(params[:article_id])  	
	end

private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
