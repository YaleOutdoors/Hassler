class LeadersController < ApplicationController

  def index
    @leaders = Leader.all
    render_success @leaders.collect{|l|l.full_profile}
  end
  
  def show
    render_success @leader.full_profile
  end

  def create
    @leader = Leader.new(leader_params)
    if @leader.save
      render_success @leader.full_profile
    else
      render_error("Leader creation failed", 500)
    end
  end

  def update
  end

  def destroy
    @leader.destroy
    render_success
  end

  private

  def find_leader
    @leader = Leader.find(params[:id])
  end

  def leader_params
    params.required(:leader).permit(:user_id, :description)
  end
end
