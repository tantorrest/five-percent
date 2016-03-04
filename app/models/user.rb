class User < ActiveRecord::Base
	validates :username, uniqueness: true, presence: true
	validates :password, presence: true
	validates_confirmation_of :password
	validates :password_confirmation, presence: true

	def self.getName id
		user = User.find_by(id: id)
		user[:username]
	end

	def self.getColors name
		user = User.where(:username => name)[0]
		colors = [user.color1, user.color2, user.color3]
		colors
	end

	def password
		@password
	end

	def password= pass
		@password = pass
		self.salt = Random.rand().to_s
		self.password_digest = Digest::SHA1.hexdigest(pass + self.salt)
	end

	def password_valid? pass
		return self.password_digest == Digest::SHA1.hexdigest(pass + self.salt)
	end
end
