class Board
    def initialize
      @tile = [["1","2","3"],["4","5","6"],["7","8","9"]]
   
    end

    def display
        puts "\n\n\n"
        puts "====================="
        puts "||     |     |     ||"
        @tile.each_with_index do |row, x|
            print "||"
            row.each_with_index do |cell, y| 
                if y <= 1
                print "  #{cell}  |"
                else
                    print "  #{cell}  "  
                end
            end 
            puts "||\n"
            if x != 2
                puts "|| ____|_____|_____||"
                puts "||     |     |     ||"
            else
                puts "||     |     |     ||"
            end
        end
        puts "====================="
        puts "\n\n\n\n"
    end

    def checkWin(player)
        win = false
        3.times do |x|
            puts x
            if @tile[x][0] == player && @tile[x][1] == player && @tile[x][2] == player
                win = true
            elsif @tile[0][x] == player && @tile[1][x] == player && @tile[2][x] == player
                win = true
            end
        end
        if @tile[0][0] == player && @tile[1][1] == player && @tile[2][2] == player
            win = true
        elsif @tile[0][2] == player && @tile[1][1] == player && @tile[2][0] == player
            win = true
        end
        return win
    end

    def newGame        
        puts "New game? (y,n)"
        answer = gets.chomp
        if answer == "y" || answer == "Y"
            board = Board.new()
            board.play
        end
    end

    def play
        game = "on"
        turn = 1
        puts "\n\n\n\n\n"
        puts "Welcome to TIC TAC TACULAR"
        puts "\n\n"
        puts "Player 'X' goes first"
        puts ""
        display()

        while game == "on"

            if turn % 2 != 0                                        #player 1 is odd player 2 is even
                player = "X"
            else
                player = "O"
            end
            puts "Player #{player}: choose your move (tile 1-9)"
                move = gets.chomp.to_i
                if move >= 1 && move <= 9
                    @tile.each_with_index do |arr, row| 
                        arr.each_with_index do |value, column|
                            if value.to_i == move.to_i 
                                @tile [row][column] = player
                            end
                        end
                    end
                end
            display
            if checkWin(player)
                puts "Player #{player} Wins"
                newGame
            end
            turn += 1
            if turn > 9
                game = "off"
                puts " TIE  Game over"
                newGame
            end
        end
    end    
end

board = Board.new()
board.play






