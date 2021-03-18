class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /places or /places.json
  def index
    @places = Place.all
  end

  # GET /places/1 or /places/1.json
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items:  [{
        name: @place.name,
        description: @place.description,
        amount: @place.price,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          place_id: @place.id
        }
      },
      success_url: "#{root_url}payments/success?placeId=#{@place.id}",
      # todo - check if we can use places_path
      cancel_url: "#{root_url}places"
    )

    @session_id = session.id

    puts "session:"
    p session
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places or /places.json
  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: "Place was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1 or /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :description, :price, :sold, :availability, :category, :user_id, :picture)
    end
end
