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

  describe Game do
    let(:player1) { Players.new('paul') }
    let(:player2) { Players.new('zay') }
    let(:player_choice) { Choices.new }
    let(:game_board) { Board.new(player1, player2) }
    let(:game) { Game.new(player1, player2, player_choice, game_board) }

    describe '#initialize' do
      it 'should have all the arguments' do
        game
      end
      it 'should set the initialize::Players ::choises ::game board' do
        expect(game.player1.name).to eq('paul')
        expect(game.player2.name).to eq('zay')
      end
    end
    describe '#all_equal_p1' do
      context 'when player_1 wins ' do
        arr = %w[f f f]
        player_icon = 'f'
        it 'should check if player_1 wins' do
          expect(game.all_equal_p1(arr, player_icon)).to_not eq(true)
        end
        it "should print  player_1's name wins! at the end" do
          expect { game.all_equal_p1(arr, player_icon) }.to output(/wins!/).to_stdout
        end
      end

      context 'when player_1 does not win should return nil ' do
        arr = %w[f g g]
        player_icon = 'f'
        it 'should check if player_1 wins' do
          expect(game.all_equal_p1(arr, player_icon)).to eq(nil)
        end
      end
    end

    describe '#check_win' do
      game_board.board[2]
      game_board.board[5]
      game_board.board[8]
      it 'should return true when there is a winning combination' do
        expect(game.check_win).to eq(true)
      end
    end
  end
end
