# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :lockable, :validatable,:omniauthable
         # omniauth_providers: [:google_oauth2]
  include DeviseTokenAuth::Concerns::User
  devise :omniauthable

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # user = User.where(:provider => auth.provider, :uid => auth.uid).first


    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
                           email: data['email'],
                           password: Devise.friendly_token[0,20]
        )
    end
    user
  end


end
