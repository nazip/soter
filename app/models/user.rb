class User < ActiveRecord::Base
  has_many :authorizations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable, :omniauthable, omniauth_providers: [:facebook, :twitter]

  def self.find_for_oauth(auth, mail = nil)
    authorization = Authorization.where(provider: auth['provider'], uid: auth['uid']).first;
    return authorization.user if authorization
    auth['info']['email'] = mail unless mail.nil?
    if auth['info']['email'].nil?
      user = User.create
      user.apply_omniauth(auth)
      user
    else
      email = auth['info']['email']
      user = User.where(email: email).first
      if user
        user.authorizations.create(provider: auth['provider'], uid: auth['uid'])
      else
        password = Devise.friendly_token[0, 20]
        user = User.create!(email: email, password: password, password_confirmation: password)
        user.authorizations.create(provider: auth['provider'], uid: auth['uid'])
      end
      user
    end
  end

  def apply_omniauth(auth)
    authorizations.build(provider: auth['provider'], uid: auth['uid'])
  end

end
