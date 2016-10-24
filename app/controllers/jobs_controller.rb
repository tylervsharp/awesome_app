class JobsController < ApplicationController
  before_action :current_job, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    Job.create(job_params)
    redirect_to jobs_path
  end

  def edit
  end

  def update
    @job.update_attributes(job_params)
    redirect_to jobs_path
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def current_job
    @job = Job.find(params[:id])
  end
end
