namespace :room do
  desc "TODO"
  task create_round: :environment do

      Room.where(active: true,finished: false).each do |room|
        cr_round = Round.where(room_id: room.id)&.order(:round_number)&.last
        if(!cr_round)
          break
        end
        active_user = RoundUser.where(round_id: cr_round.id)
        
        active_user.each do |user|
          cruser = User.find(user.user_id)
          cruser.rounds_played += 1
          if(user.x_decision != cr_round.x_decision)
            ru = RoomUser.where(user_id: user.user_id, room_id: room.id).first
            ru.alive = false
            ru.save
          else
            cruser.round_wins += 1
          end
          cruser.save
        end
        
        alive_users_count = RoomUser.where(room_id: room.id,alive: true).count
        if(alive_users_count == 1)
          user = RoomUser.where(room_id: room.id,alive: true).first
          user = User.find(user.user_id)
          user.balance += room.prizepool
          user.game_wins += 1
          room.finished = true
          room.save
          user.save

        end
      end

      Room.where(active: true,finished: false).each do |room|
        round_number = Round.where(room_id: room.id)&.order(:round_number)&.last&.round_number
        if (round_number)
          round_number += 1
        else 
        round_number = 1
        end
        round = Round.create({room_id: room.id,round_number: round_number, x_decision: rand(2).zero? })
        RoomUser.where(room_id: room.id).each do |user|
        RoundUser.create({round_id: round.id, user_id: user.user_id })
        end
      end
  end
end
