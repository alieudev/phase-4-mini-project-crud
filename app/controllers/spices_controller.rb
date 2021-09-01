class SpicesController < ApplicationController
    #GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # #GET /spices/:id
    # def show
    #     spice = find_spice
    #     render json:spice
    # end

    #POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH /spices/:id
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted
        else
            error_message
        end
        
    end

    #DELETE /spices/:id
    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else
            error_message
        end
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def error_message
        render json: {error: "Spice not found"}, status: :not_found
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

end
