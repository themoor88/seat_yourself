class ReservationsController < ApplicationController
  before_filter :get_restaurant
  before_filter :get_reservation, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_owns_reservations


  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def show
  end

  def edit
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id

    calculated_capacity = @restaurant.reservations
                                       .where("date > :start_time AND date < :end_time", {
                                         start_time: @reservation.date,
                                         end_time:   @reservation.date + 1.hours
                                       }).map(&:party_size).sum

    # if @restaurant.capacity <= calculated_capaticity

    # end
    if @reservation.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def update

    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_reservation_path(@restaurant, @reservation)
    else
      render :edit
    end

  end

  def destroy
    @reservation.destroy
    redirect_to restaurants_path
  end

  private
  # def authenticate_owns_reservations
  #   unless current_user.id == @reservation.user_id
  #     flash[:alert] = "Yo been lookin' where shouldn't have mister..."
  #     redirect_to "/"
  #   end
  # end

  def reservation_params
    params.require(:reservation).permit(:party_size, :date)
  end

  def get_reservation
    @reservation = Reservation.find(params[:id])
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end