class ProposalsController < ApplicationController
  before_filter :authenticate_user!  

  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def edit
    @proposal = Proposal.all.find(params[:id])
  end

  def create
    @proposal = Proposal.all.build(params[:proposal])

    if @proposal.save
      redirect_to(admin_proposals_path, :notice => t('crud.was_created', :name => t('activerecord.models.proposal', :count => 1)))
    else
      render :action => "new"
    end
  end

  def update
    @proposal = Proposal.all.find(params[:id])

    if @proposal.update_attributes(params[:proposal])
      redirect_to(admin_proposals_path, :notice => t('crud.was_updated', :name => t('activerecord.models.proposal', :count => 1)))
    else
      render :action => "edit"
    end
  end

  def destroy
    @proposal = Proposal.all.find(params[:id])
    begin
      @proposal.destroy
      flash[:errors] = t(:destroy_proposal_success)
    rescue ActiveRecord::DeleteRestrictionError
      flash[:errors] = t(:failed_to_destroy_proposal)
    end

    redirect_to(admin_proposals_path)
  end

end
