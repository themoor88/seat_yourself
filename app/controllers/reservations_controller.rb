class ReservationsController < ActiveController
  def index
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(restaurant_params)
    if @reservation.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(restaurant_params)
      redirect_to @reservation
    else
      render :edit
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :phone, :address, :description)
  end
end