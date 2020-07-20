require 'pry'

def get_first_name_of_season_winner(data, season)
  winner = data[season].find { |contestant| contestant['status'] == 'Winner' }

  winner['name'].split(' ')[0]
end

def get_contestant_name(data, occupation)
  contestant = nil

  data.values.find do |season|
    contestant = season.find do |contestant|
      contestant['occupation'] == occupation
    end
  end

  contestant['name']
end

def count_contestants_by_hometown(data, hometown)
  data.values.reduce([]) do |collection, season|
    collection << season.select { |contestant| contestant['hometown'] == hometown }
    collection.flatten
  end.length
end

def get_occupation(data, hometown)
  contestant = nil

  data.values.find do |season|
    contestant = season.find do |contestant|
      contestant['hometown'] == hometown
    end
  end

  contestant['occupation']
end

def get_average_age_for_season(data, season)
  total_age = data[season].map { |contestant| contestant["age"].to_f }.sum

  (total_age / data[season].length.to_f).round
end