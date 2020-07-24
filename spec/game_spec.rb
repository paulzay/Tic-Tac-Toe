require './lib/board'
require './lib/game'
require './lib/players'
require './lib/choices'

describe 'Tic tac toe' do
  describe Players do
    let(:players) { Players.new('paul') }
    context '#initialize' do
      it 'should accept an arg' do
        expect { initialize('paul') }.to_not raise_error
      end

      it 'should set the instance variables @name, @slogan, and @student_capacity' do
        expect(players.instance_variable_get(:@first_player_icon)).to eq('X')
        expect(players.instance_variable_get(:@second_player_icon)).to eq('O')
      end
    end

    context '#name' do
      it "returns the player's name" do
        name = 'Paul'
        player = Players.new(name)
        expect(player.name).to eq 'Paul'
      end
    end
  end

  describe Board do
    let(:player1) { Players.new('Paul') }
    let(:player2) { Players.new('Zay') }
    let(:board) { Board.new(player1, player2) }

    describe '#initialize' do
      it 'should accept player names as args' do
        board
      end

      it 'should set highest turns to equal 9' do
        grid = board.instance_variable_get(:@board)

        expect(grid.length).to eq(9)
      end
    end

    describe '#display_board' do
      it 'Displays the board for the players.' do
        expect(board.display_board).to eql "1 | 2 | 3\n" \
        "---------\n" \
        "4 | 5 | 6\n" \
        "---------\n" \
        "7 | 8 | 9\n" \
      end
    end
  end

  # describe Game do
  #   let (:bob) { Players.new({first_player_icon: "X", name: "bob"}) }
  #   let (:frank) { Players.new({second_player_icon: "O", name: "frank"}) }
  #   let (:game) { Game.new([bob, frank]) }

  #   context "#initialize" do
  #     it "randomly selects a current_player" do
  #       allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
  #       game = Game.new([bob, frank])
  #       expect(game.current_player).to eq frank
  #     end

  #     it "randomly selects an other player" do
  #       allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
  #       game = Game.new([bob, frank])
  #       expect(game.other_player).to eq bob
  #     end
  #   end
  # end
end
