class ReservationsController < ApplicationController
  before_filter :ensure_logged_in
  before_action :load_restaurant

  def index
    # fing_by only returns the first record matched
    # use where to find all 
    @reservations = current_user.reservations 
    # @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    # @reservation = Reservation.new(reservation_params)
    # @reservation.restaurant_id = @restaurant.id
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to restaurant_reservations_path
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_reservation_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_reservation_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:party_size, :dinner_time, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
