class OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy]
  before_action :verify_admin!

  def index
    @offers = Offer.all.order(premium: :desc)
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to(offers_path, notice: 'Offer was successfully created.') }
        format.json { render :index, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to(offers_path, notice: 'Offer was successfully updated.') }
        format.json { render :index, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def verify_admin!
    redirect_to root_path if current_user.nil? || !current_user.admin?
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium, :enable, :enable_admin)
  end
end
