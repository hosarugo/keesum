class AdvertisementsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy, :favorited, :unfavorite]

  def favorited
    current_user.favorite @advertisement
    redirect_to advertiseent_path(@advertisement.id)
  end

  def unfavorite
    current_user.favorites.where('favoritable_id = ? ', @advertisement.id).delete_all
    redirect_to advertisement_path(@advertisement.id)
  end

  def index
     @advertisement = Advertisement.all

    # @advertisement = Advertisement.geocoded

    # if params[:search].present?
    #       #param_geocoding = params[:in].geo
    #       @advertisement = @advertisement.near(params[:search], 50, :units => :km)
    #     end

    #     @hash = Gmaps4rails.build_markers(@advertisement) do |advertisement, marker|
    #       marker.lat advertisement.latitude
    #       marker.lng advertisement.longitude

    #       marker.json({ :id => advertisement.id})


    #       # marker.infowindow render_to_string(partial: "/shared/card", locals: { advertisement: advertisement })

    #       authorize @advertisement
    #     end
    #     @user = User.find(current_user.id)
    #     # place_coordinates
    #     # coordinates

    #     respond_to do |format|
    #       if request.xhr?
    #         format.js
    #       else
    #         format.html
    #       end
    #     end
    #     @advertisements = Advertisement.all
    #   end
     end

    def new
      @user = User.find(current_user.id)
      @advertisement = Advertisement.new
      # authorize @advertisement
    end

    def create
      @user = User.find(current_user.id)
      @advertisement = @user.advertisements.new(advertisement_params)
      @advertisement.features = params[:features]
      authorize @advertisement
      if @advertisement.save
        redirect_to advertisement_path(@advertisement.id)
      else
      # GO BACK TO THE FORM
      puts "not working"
      render :new
    end
  end

  def show
      #@user = User.find(current_user.id)
      set_advertisement
      @hash = Gmaps4rails.build_markers(@advertisement) do |advertisement, marker|
        marker.lat advertisement.latitude
        marker.lng advertisement.longitude
      end
      authorize @advertisement
    end

    def edit
        @user = User.find(current_user.id)

  @advertisement = Advertisement.find(params[:id])
  authorize @advertisement
    end

    def update
        @advertisement = Advertisement.find(params[:id])
  @advertisement.update(advertisement_params)
  authorize @advertisement
  redirect_to advertisements_path(@advertisement.id)

    end

    def destroy
        @advertisement = Advertisement.find(params[:id])
  @advertisement.destroy
  authorize @advertisement

  redirect_to user_path(current_user.id)
    end

    def advertisment_coordinates
          @advertisement_coordinates = @advertisement.map do |advertisement|
      lng = advertisement.longitude unless advertisement.longitude.nil?
      lat =  advertisement.latitude unless advertisement.latitude.nil?
      feature = { "type": "Feature",
                  "properties": {
                    "description":
                    "<div class=\"popup-bottom\">
                      <h4 class=\"bold\">#{advertisement.name}</h4>
                    </div>"
                  },
                  "geometry": {
                      "type": "Point",
                      "coordinates": [lng, lat]
                  }
      }
      feature
    end
    end

    def coordinates
         @coordinates = @advertisement.map do |advertisement|
      unless advertisement.longitude.nil? || advertisement.latitude.nil?
        [advertisement.longitude, advertisement.latitude]
      end
    end
    end

  private

    def advertisement_params
        params.require(:avdertisement).permit(:name, :email, :search, :address, :phone,
    :description, :features, :tags, photos: [])
    end

    def set_advertisement
        @advertisement = Advertisement.find(params[:id])
    end
  end
