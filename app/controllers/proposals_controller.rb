class ProposalsController < ApplicationController
  before_filter :authenticate_user!  

  def index
    @proposals = current_user.proposals
  end

  def new
    @proposal = Proposal.new
  end

  def show
    @proposal = current_user.proposals.find(params[:id])
  end

  def edit
    @proposal = current_user.proposals.find(params[:id])
  end

  def create
    @proposal = current_user.proposals.build(params[:proposal])

    if @proposal.save
      redirect_to(proposal_path(@proposal), :notice => "Proposal was created")
    else
      render :action => "new"
    end
  end

  def update
    @proposal = current_user.proposals.find(params[:id])
    params[:proposal].delete([:user_id])
    if @proposal.update_attributes(params[:proposal])
      redirect_to(proposal_path(@proposal), :notice => t('crud.was_updated', :name => t('activerecord.models.proposal', :count => 1)))
    else
      render :action => "edit"
    end
  end

end
