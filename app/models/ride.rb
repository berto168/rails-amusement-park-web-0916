class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  attr_accessor :flash

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    if @user.height < @attraction.min_height && @attraction.tickets > @user.tickets
      self.flash = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      self.flash = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @attraction.tickets > @user.tickets
      self.flash = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    else
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.tickets -= @attraction.tickets
      @user.save!
      self.flash = "Thanks for riding the #{@attraction.name}!"
    end
  end

end
