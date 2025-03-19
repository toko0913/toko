class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:destroy]
    before_action :authorize_comment, only: [:destroy]

    def create
        anime = Anime.find(params[:anime_id])
        comment = anime.comments.build(comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
        comment.user_id = current_user.id
        if comment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path) #直前のページにリダイレクト
        end
    end

    def destroy
        @comment.destroy
        flash[:success] = "コメントを削除しました"
        redirect_back(fallback_location: root_path)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def authorize_comment
        unless @comment.user_id == current_user.id
        redirect_back(fallback_location: root_path)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
