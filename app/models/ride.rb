class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    # binding.pry
    #who is user
    #what is attraction
    if @user.height < @attraction.min_height && @attraction.tickets > @user.tickets
      "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @attraction.tickets > @user.tickets
      "Sorry. You do not have enough tickets the #{@attraction.name}."
    else
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.tickets -= @attraction.tickets
      @user.save
    end
  end

end
