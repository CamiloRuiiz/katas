class Player
  SCORES = [0, 15, 30, 40, 0]
  
  def initialize
    @score_index = 0
  end
  
  def score
    SCORES[@score_index]
  end
  
  def win_ball
    @score_index += 1
  end
  
  def won_games
    return 1 if @score_index == 4
    0
  end
end

describe 'Kata Tennis' do
  context 'Each player can have either of these points in one game 0 15 30 40' do
    it 'Initial score should be 0' do
      player = Player.new 
      expect(player.score).to eq(0)
    end

    it 'Score goes from 0 to 15' do
      player = Player.new
      player.win_ball
      expect(player.score).to eq 15
    end
    
    it 'Score goes form 15 to 30' do
      player = Player.new
      player.win_ball
      player.win_ball
      expect(player.score).to eq 30
    end
    
    it 'Score goes form 30 to 40' do
      player = Player.new
      player.win_ball
      player.win_ball
      player.win_ball
      expect(player.score).to eq 40
    end
  end

  context 'If you have 40 and you win the ball' do
    it 'you win the game' do
      player = Player.new
      player.win_ball
      player.win_ball
      player.win_ball
      expect(player.won_games).to eq 0
      player.win_ball
      expect(player.score).to eq 0
      expect(player.won_games).to eq 1
    end
  end
  
  context 'If both have 40 the players are deuce' do
    it 'the winner of a ball will have advantage and game ball' do
      player1 = Player.new
      player2 = Player.new
      game = Game.new(player1, player2)
      3.times do 
        player1.win_ball
        player2.win_ball
      end
      player1.win_ball
      expec(player1.score).to eq 40
      expect(game.winner).to eq nil
    end
  end
end