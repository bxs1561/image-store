class ApplicationController < ActionController::API # Note: here is not ::BASE
  include DeviseTokenAuth::Concerns::SetUserByToken
end


