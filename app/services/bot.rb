class Bot
  COMMANDS = { start: '/start',
               eat: "Поесть \u{1f60e}",
               play: "Поиграть \u{1F0CF}",
               timing: ' минут' }

  def initialize(chat, user, incoming_message)
    @chat, @user, @incoming_message = chat, user, incoming_message
  end

  def reply
    if @incoming_message == COMMANDS[:eat]
      event = Event.create(user_id: @user.id, event_type: :eat)

      floors = EventPlace.where(enjoy_type: event.event_type).map do |e|
        e.floor.to_s
      end

      @chat.send_message('Выберите этаж',
                         keyboard: floors.uniq.sort.each_slice(2).to_a)
    elsif @incoming_message == COMMANDS[:play]
      event = Event.create(user_id: @user.id, event_type: :play)

      floors = EventPlace.where(enjoy_type: event.event_type).map do |e|
        e.floor.to_s
      end

      @chat.send_message('Выберите этаж',
                         keyboard: floors.uniq.sort.each_slice(2).to_a)
    elsif /\d+/ === @incoming_message && all_floors&.include?(@incoming_message)
      last_user_event = Event.where(user_id: @user).last

      if last_user_event
        last_user_event.update(floor: @incoming_message.to_i)

        selected_event_places =
          EventPlace.where(enjoy_type: last_user_event.event_type,
                           floor: @incoming_message.to_i).map(&:title)

        # last_user_event.destroy

        @chat.send_message('Выберите место',
                           keyboard: selected_event_places.each_slice(2).to_a)
      end
    elsif all_titles.include?(@incoming_message)
      last_user_event = Event.where(user_id: @user).last

      if (last_user_event)
        last_user_event.update(place_title: @incoming_message)

        event_place = EventPlace.find_by(floor: last_user_event.floor,
                                         title: @incoming_message)
        if event_place
          places_count = event_place.places_count

          occupied_places_count =
            EventUser.where(event_place_id: event_place.id).select do |event_user|
              event_user.expiration > Time.now
            end.count

          free_places_count = places_count - occupied_places_count

          @chat.send_message("#{free_places_count} свободных мест")

          @chat.send_message(
            'Сколько с вами человек?',
            keyboard: (['+0', '+1', '+2', '+3', '+4']).each_slice(2).to_a)
        end
      end
    elsif @incoming_message.include?('+')
      last_user_event = Event.where(user_id: @user).last

      if (last_user_event)
        last_user_event.update(persons_count: @incoming_message.split('+').last.to_i)

        event_place = EventPlace.find_by(floor: last_user_event.floor,
                                         title: last_user_event.place_title)
        if event_place
          places_count = event_place.places_count

          occupied_places_count =
            EventUser.where(event_place_id: event_place.id).select do |event_user|
              event_user.expiration > Time.now
            end.count

          free_places_count = places_count - occupied_places_count

          if free_places_count >= @incoming_message.to_i + 1
            last_user_event.update(persons_count: (@incoming_message.to_i + 1))

            @chat.send_message(
              'Выберите время',
              keyboard: (['10 минут', '20 минут', '30 минут', '60 минут']).
                each_slice(2).to_a)
          else
            @chat.send_message('К сожалению, так нельзя')
          end
        end
      end
    elsif @incoming_message.include?(COMMANDS[:timing])
      last_user_event = Event.where(user_id: @user).last

      if last_user_event
        time = @incoming_message.split(COMMANDS[:timing]).first.to_i
        end_time = Time.now + time.minutes

        event_place =
          EventPlace.find_by(title: last_user_event.place_title,
                           floor: last_user_event.floor)

        EventUser.create(user_id: @user.id,
                         expiration: end_time,
                         event_place_id: event_place.id,
                         count: last_user_event.persons_count)

        @chat.send_message("#{event_place.title} успешно зарезервировано на #{time} минут")
      end
    elsif @incoming_message == COMMANDS[:start]
      @chat.send_message(
        'Выберите активнось',
        keyboard: ([COMMANDS[:eat], COMMANDS[:play]]).each_slice(2).to_a)
    else
      @chat.send_message(
        'Выберите активнось',
        keyboard: ([COMMANDS[:eat], COMMANDS[:play]]).each_slice(2).to_a)
    end
  end

  private

  def all_floors
    EventPlace.all.map { |ep| ep.floor.to_s }
  end

  def all_titles
    EventPlace.pluck(:title)
  end
end
