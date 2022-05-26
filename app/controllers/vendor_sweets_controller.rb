class VendorSweetsController < ApplicationController


    def index 
        vendorsweet = VendorSweet.all
        render json: vendorsweet, status: 200
    end

    def show 
        vendorsweet= VendorSweet.find_by(id: params[:id])
        if vendorsweet 
            render json:vendorsweet
        else 
            render json: {error: "VendorSweet not found"}
    end
end

    def create 
    newVen = VendorSweet.create(vensweet_params)
    if newVen.valid?
        render json: newVen, status: 201
    else 
        render json: {"errors": ["validation errors"]}, status: 422 
    end
end

def destroy
    sweetven = VendorSweet.find_by(id: params[:id])
    if sweetven
    sweetven.destroy
    render json: weird
    else
    render json: {"error": "VendorSweet not found"}, status: 404
    end
end


end





private 

def vensweet_params
params.permit(:vendor_id, :sweet_id, :price)
end

def weird 
{}
end

