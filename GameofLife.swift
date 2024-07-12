import Foundation

/*
ORG    NEW    STATE
0       0       0
1       1       1
1       0       2
0       1       3
 */

class GameOfLife {

    func gameOfLife(_ board: inout [[Int]]) {
        guard !board.isEmpty else {
            return
        }
        let rows = board.count
        let col = board[0].count

        for i in 0..<rows {
            for j in 0..<col {
                let liveNei = countLiveNeigbors(&board, i, j, rows, col)
                if board[i][j] == 1 {
                    if liveNei == 2 || liveNei == 3 {
                        
                    } else {
                        board[i][j] = 2 // cell dies 1 -> 0 temp
                    }
                } else if board[i][j] == 0 {
                    if liveNei == 3 {
                        board[i][j] = 3 // cell gives birth 0 -> 1 temp
                    }
                }
            }
        }

        for i in 0..<rows {
            for j in 0..<col {
                if board[i][j] == 2 {
                    board[i][j] = 0
                }
                if board[i][j] == 3 {
                    board[i][j] = 1
                }
            }
        }

        print("updated BOARD = \(board)")
    }

    func countLiveNeigbors(_ board: inout [[Int]], _ i: Int, _ j: Int, _ rows: Int, _ col: Int) -> Int {
        var live: Int = 0
        for x in (i-1)...i+1 {
            for y in j-1...j+1 {
                if x < 0 || y < 0 || x >= rows || y >= col {
                    continue
                }
                /// ignore `i` and `j` position.
                if x == i && y == j {
                    continue
                }
                if board[x][y] == 1 || board[x][y] == 2 {
                    live += 1
                }
            }
        }
        return live
    }
}

let game = GameOfLife()
var board:[[Int]] = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
game.gameOfLife(&board)
