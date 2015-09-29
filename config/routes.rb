Rails.application.routes.draw do
  get "/tic-tac-toe", to: "tictactoe#move"
end
