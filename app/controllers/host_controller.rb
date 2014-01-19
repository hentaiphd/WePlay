class HostController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @host = Host.new

    respond_to do |format|
      if @host.save
        format.json { render action: 'show', status: :created, location: @host }
      else
        format.html { render action: 'new' }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @host = Host.find(params[:id])
    end

    def host_params
      params.require(:host).permit()
    end
end
