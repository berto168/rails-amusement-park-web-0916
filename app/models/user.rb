class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    validates :password_digest, presence: true

    def mood
      if self.nausea.nil?
        self.nausea = 0
      end

      if self.happiness.nil?
        self.happiness = 10
      end

      if self.nausea > self.happiness
        'sad'
      else
        'happy'
      end
    end


end
