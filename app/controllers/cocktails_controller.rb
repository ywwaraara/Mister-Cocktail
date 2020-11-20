class CocktailsController < ApplicationController
  # before_action :cocktail_params, only [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save!
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def destroy
    @cocktail.destroy
    # DELETE FROM restaurants WHERE id = id
    # UPDATE restaurants SET destroyed_at = Time.now WHERE id = id
    redirect_to cocktails_url, notice: 'Cocktail was successfully deleted.'
  end

  private
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
end



