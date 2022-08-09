class Api::V1::SessionsController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
def create
    @user=User.where(email:params[:email]).first
    if @user&&@user.valid_password?(params[:password])
        @token=SecureRandom.hex(32)
        @user.token=@token
        @user.save
       render json: @token,status: :created
    else
        head(:unauthorized)
    end

end

def destroy
    @u=User.where(token: request.headers[:token])
   
     if @u.empty?
        render json: {"message": "unauthorized"}
     else
        @u=@u.first
     end
    byebug
    @u.token = nil
    @u.save
    render json: {"message": "LOGOUT SUCCESSFULLY"}  
end

end