require "tic-tac-toe"

describe Game do

  describe "game" do
    subject(:game) {Game.new}

    let (:new_board) do
      {
      1 => "-",
      2 => "-",
      3 => "-",
      4 => "-",
      5 => "-",
      6 => "-",
      7 => "-",
      8 => "-",
      9 => "-"
    }
    end

    describe "initialize game" do
      it "creates an empty board" do
        expect(game.board_hash).to eql(new_board)
      end
    end
  end

end