class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @report = @article.reports.new(report_params)
    @report.user = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to @article, notice: 'Article has been reported.' }
        format.json { render json: { success: true } }
      else
        format.html { redirect_to @article, alert: @report.errors.full_messages.join(', ') }
        format.json { render json: { errors: @report.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason)
  end
end
