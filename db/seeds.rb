def seed_database
  kitchen = 'Кухня'
  balckony = 'Балкон'
  tennis = 'Настольный теннис'
  x_box = 'XBox'
  guitar = 'Гитара'
  kiker =  'Кикер'

  (8..13).to_a.each do |floor|
    EventPlace.create(title: balckony, floor: floor, places_count: 3, enjoy_type: :eat)

    if (9..12).include?(floor)
      EventPlace.create(title: kitchen, floor: floor, places_count: 12, enjoy_type: :eat)
    end

    if floor == 10
      EventPlace.create(title: guitar, floor: floor, places_count: 1, enjoy_type: :play)
      EventPlace.create(title: x_box, floor: floor, places_count: 4, enjoy_type: :play)
    end

    if floor == 11
      EventPlace.create(title: tennis, floor: floor, places_count: 2, enjoy_type: :play)
    end

    if floor == 12
      EventPlace.create(title: kiker, floor: floor, places_count: 4, enjoy_type: :play)
    end
  end
end

def clean_all_event_places
  EventPlace.destroy_all
end

puts 'Start'
clean_all_event_places
seed_database
puts 'Success'
