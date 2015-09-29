class TictactoeController < ApplicationController
  def move
    sent_board = Board.from_string(params["board"])

    render text: sent_board.to_wave_string
  end
end
