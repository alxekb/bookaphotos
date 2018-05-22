class Profile
  module Photographer
    class AdditionalOptionsController < Profile::PhotographerController
      before_action :set_additional_option, only: [:show, :edit, :update, :destroy]

      respond_to :html, :js, :json

      def index
        @additional_options = AdditionalOption.all
        respond_with(@additional_options)
      end

      def show
        respond_with(@additional_option)
      end

      def new
        @additional_option = @user.additional_options.new
        respond_with(@additional_option)
      end

      def edit
      end

      def create
        @additional_option = @user.additional_options.new(additional_option_params)
        @additional_option.save
        respond_with(@additional_option, location: [:photographer, @additional_option])
      end

      def update
        @additional_option.update(additional_option_params)
        respond_with(@additional_option, location: [:photographer, @additional_option])
      end

      def destroy
        @additional_option.destroy
        respond_with(@additional_option, location: photographer_additional_options_path)
      end

      private

      def set_additional_option
        @additional_option = AdditionalOption.find(params[:id])
      end

      def additional_option_params
        params.require(:additional_option).permit(:name)
      end
    end

  end
end