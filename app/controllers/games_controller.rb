def generate_grid(grid_size)
  grid = ''
  grid_size.times { grid += ("A".."Z").to_a.sample }
  return grid.split('')
end


def valid_answer(attempt, grid)
  attempt_hash = Hash.new(0)
  grid_hash = Hash.new(0)
  valid_word = true
  attempt.upcase.split('').each { |c| attempt_hash[c] += 1 }
  grid.each { |c| grid_hash[c] += 1 }
  attempt_hash.each { |key, value| valid_word = false if grid_hash[key] < value }
  valid_word
end

class GamesController < ApplicationController
  def new
    @grid = generate_grid(10)
  end

  def score
    @grid = params[:grid].split('')
    @userGuess = params[:userGuess]
    @result = valid_answer(@userGuess, @grid)
  end
end
