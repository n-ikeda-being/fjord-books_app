# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :check_user, only: %i[create edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments.includes(:user)
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.build(report_params)

    if @report.save
        redirect_to report_url(@report), notice: t('controllers.common.Report_was_successfully_created')
    else
        render :new, status: :unprocessable_entity
    end

  end

  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: t('controllers.common.Report_was_successfully_updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.Report_was_successfully_destroyed')
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :memo)
  end

  def check_user
    @report = Report.find(params[:id])
    redirect_to reports_path, notice: t('controllers.common.cannot_edit') unless current_user == @report.user
  end

end
