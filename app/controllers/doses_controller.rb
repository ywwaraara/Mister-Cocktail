class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(id: @cocktail.id)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully deleted.'
  end


  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
