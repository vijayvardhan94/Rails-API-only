module Api
    module V2
        class StoresController < ApplicationController
            def index
                render json: Store.all, status: :ok
            end

            
            def create
                store = Store.new(store_params)

                if store.save
                    render json: store, status: :created
                else
                    render json: store.errors, status: :unprocessable_entity
                end
            end

            def show
                store = Store.find(params[:id])
                render json: store
            
            rescue ActiveRecord::RecordNotFound
                    render json: {error: "Store doesnt exist"}
                
            end

            def destroy
                Store.find(params[:id]).destroy
                
            end

            private

            def store_params
                params.require(:store).permit(:name, :address)
            end

        end
    end
end


