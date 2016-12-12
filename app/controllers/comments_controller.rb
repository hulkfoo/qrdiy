class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @status = Status.find(params[:status_id])
    Publication.create_publishable!("comment", {status: @status },
      {content: params[:comment][:content], user: current_user, project: @status.project})

    redirect_to @status.project

  end

  def destroy
    authorize @comment
    @comment.destroy

    redirect_to :back
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params

    end
end