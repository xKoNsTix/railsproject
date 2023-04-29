class RoundsController < ApplicationController

    def index
        @round = Round.find(params[:id])
        @active_user = RoomUser.where(room_id: Round.find(params[:id]).room_id,alive: true).count
    end

    def x
        @round = Round.find(params[:id])
        ru = RoundUser.where(user_id: current_user.id).where(round_id: params[:id]).first
        @active_user = RoomUser.where(room_id: @round.room_id,alive: true).count
        ru.x_decision = true
        ru.save

        if(Time.at(@round.created_at + 60) < Time.now() )
            if (ru.x_decision == @round.x_decision)

                if(RoomUser.where(room_id: @round.room_id,alive: true).count == 1)
                redirect_to :action => "win"
                else
                    redirect_to :action => "correct"
                end
            else
                redirect_to :action => "false"  
            end
        end
    end

    def o
        @round = Round.find(params[:id])
        ru = RoundUser.where(user_id: current_user.id).where(round_id: params[:id]).first
        @active_user = RoomUser.where(room_id: @round.room_id,alive: true).count
        ru.x_decision = false
        ru.save
        if(Time.at(@round.created_at + 60) < Time.now() )
            if (ru.x_decision == @round.x_decision)

                if(RoomUser.where(room_id: @round.room_id,alive: true).count == 1)
                redirect_to :action => "win"
                else
                    redirect_to :action => "correct"
                end
            else
                redirect_to :action => "false"  
            end
        end
    end

    def correct
        @round = Round.find(params[:id])
        
    end
    
    def false
        @round = Round.find(params[:id])
        room = Room.find(@round.room_id)
        roomuser = RoomUser.where(user_id: current_user.id, room_id: room.id).first
        roomuser.alive = false
        roomuser.save
    end

    def win
        @round = Round.find(params[:id])
    end

end
