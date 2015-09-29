class TictactoeController < ApplicationController
  def move
    sent_board = Board.from_string(params["board"])

    if sent_board
      if sent_board.is_valid?
        if sent_board.plausibly_the_turn_of_o?
          render text: sent_board.to_wave_string
        else
          render text: "error: it is not plausibly the turn of o.", status: 400
        end
      else
        render text: "error: this board has an inbalanced number of heads and tails", status: 400
      end
    else
      render text: "error: this was not a valid board", status: 400
    end
  end
end
