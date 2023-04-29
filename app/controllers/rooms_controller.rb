class RoomsController < ApplicationController

  def active
    @rooms = Room.joins("INNER JOIN room_users ON room_users.room_id = rooms.id AND room_users.user_id = #{current_user.id} AND rooms.active = true AND room_users.alive = true AND rooms.finished = false")
    @rounduser = RoundUser.where(user_id: current_user.id)
  end

  def open
    @rooms = Room.where(active: false)
    @rounduser = RoundUser.where(user_id: current_user.id)
  end

  def create
    @room = Room.new(active: false,prizepool: 1000, finished: false)
    if @room.save   
      redirect_to action: 'open'
    end
  end

  def join
      room = Room.find(params[:id])
      room.active = true
      room.save
      current_user.balance -= 10
      current_user.save
      RoomUser.create(room_id: room.id, user_id: current_user.id, alive: true)
      redirect_to action: 'open'
  end

end
