//: Playground - noun: a place where people can play

import UIKit


func formMatrix(_ x:Int, _ y:Int) -> [[Int]]{
var matrix:[[Int]] = Array(repeating: Array(repeating: 0, count: x), count: y)//x is row y is column
for i in 0..<x{
    for k in 0..<y{
        matrix[i][k] = k
        }
    }
    for i in 0..<x{
        for k in 0..<y{
            matrix = shuffleMatrix(&matrix, i, k)
        }
    }
    
    return matrix
}
func shuffleMatrix(_ s_matrix: inout [[Int]], _ i:Int, _ k:Int)->[[Int]]{
    
    for i in 0...k{
        let j = Int(arc4random_uniform(10))
        s_matrix[i].swapAt(k, j)
    }
    
  return s_matrix
}
func leastPathSum(_ matrix:[[Int]],_ i: inout Int,_ k: inout Int, _ Array: inout [Int])->[Int]{
    
    var a:Int
    var b:Int
    if i == 0{
        Array.append(matrix[i][k])
        if k < 1 {
            if matrix[i+1][k] > matrix[i+1][k+1]{
                a = i + 1
                b = k + 1
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k] < matrix[i+1][k+1]{
                a = i + 1
                b = k
                leastPathSum(matrix,&a,&b,&Array)
            }
        }
        else if k > 0 && k < 9{
            if matrix[i+1][k-1] > matrix[i+1][k] && matrix[i+1][k+1] > matrix[i+1][k]{
                a = i + 1
                b = k
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k-1] < matrix[i+1][k] && matrix[i+1][k-1] < matrix[i+1][k+1]{
                a = i + 1
                b = k - 1
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k-1] > matrix[i+1][k+1] && matrix[i+1][k] > matrix[i+1][k+1]{
                a = i + 1
                b = k + 1
                leastPathSum(matrix,&a,&b,&Array)
            }
        }
        else if k == 9{
            if matrix[i+1][k] < matrix[i+1][k-1]{
                a = i + 1
                b = k
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k] > matrix[i+1][k-1]{
                a = i + 1
                b = k - 1
                leastPathSum(matrix,&a,&b,&Array)
            }
        }
    }//i == 0
    if i > 0 && i < 8{
        Array.append(matrix[i][k])
        if k < 1 {
            if matrix[i+1][k] > matrix[i+1][k+1]{
                a = i + 1
                b = k + 1
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k] < matrix[i+1][k+1]{
                a = i + 1
                b = k
                leastPathSum(matrix,&a,&b,&Array)
            }
        }
        else if k > 0 && k < 9{
            if matrix[i+1][k-1] > matrix[i+1][k] && matrix[i+1][k+1] > matrix[i+1][k]{
                a = i + 1
                b = k
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k-1] < matrix[i+1][k] && matrix[i+1][k-1] < matrix[i+1][k+1]{
                a = i + 1
                b = k - 1
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k-1] > matrix[i+1][k+1] && matrix[i+1][k] > matrix[i+1][k+1]{
                a = i + 1
                b = k + 1
                leastPathSum(matrix,&a,&b,&Array)
            }
        }
        else if k == 9{
            if matrix[i+1][k] < matrix[i+1][k-1]{
                a = i + 1
                b = k
                leastPathSum(matrix,&a,&b,&Array)
            }
            else if matrix[i+1][k] > matrix[i+1][k-1]{
                a = i + 1
                b = k - 1
                leastPathSum(matrix,&a,&b,&Array)
            }
        }
    }//i > 0 && i < 8
    if i == 8{
        Array.append(matrix[i][k])
        if k < 1 {
            if matrix[i+1][k] > matrix[i+1][k+1]{
                a = i + 1
                b = k + 1
                Array.append(matrix[a][b])
            }
            else if matrix[i+1][k] < matrix[i+1][k+1]{
                a = i + 1
                b = k
                Array.append(matrix[a][b])
            }
        }
        else if k > 0 && k < 9{
            if matrix[i+1][k-1] > matrix[i+1][k] && matrix[i+1][k+1] > matrix[i+1][k]{
                a = i + 1
                b = k
                Array.append(matrix[a][b])
            }
            else if matrix[i+1][k-1] < matrix[i+1][k] && matrix[i+1][k-1] < matrix[i+1][k+1]{
                a = i + 1
                b = k - 1
                Array.append(matrix[a][b])
            }
            else if matrix[i+1][k-1] > matrix[i+1][k+1] && matrix[i+1][k] > matrix[i+1][k+1]{
                a = i + 1
                b = k + 1
                Array.append(matrix[a][b])
            }
        }
        else if k == 9{
            if matrix[i+1][k] < matrix[i+1][k-1]{
                a = i + 1
                b = k
                Array.append(matrix[a][b])
            }
            else if matrix[i+1][k] > matrix[i+1][k-1]{
                a = i + 1
                b = k - 1
                Array.append(matrix[a][b])
            }
        }
        
    }
    return Array
}
func printMatrix(_ matrix: [[Int]]){
    for i in 0...9{
        
        print(matrix[i])
    }
}

var a:Int = 0
var b:Int = 9
var Values:[Int] = []

let x = formMatrix(10,10)





class path:Operation{
    
    var matrix:[[Int]]
    var path:[Int] = []
    var sum:Int = 0
    var row:Int = 0
    var col:Int = 9
    var fin:Bool = false
    
    
    init(_ matrix:[[Int]],_ col:Int){
        self.matrix = matrix
        self.col = col
    }
    override func main() {
        self.path = leastPathSum(matrix,&row,&col,&path)
        self.sum = path.reduce(0,+)
        isFinished = true
    }
    override var isFinished: Bool{
        get{
            return fin
        }
        set{
            self.fin = newValue
        }
    }


}
var operations:[path] = []

for i in 0...9{
    let instance = path(x,i)
    operations.append(instance)
}

let queue = OperationQueue()
queue.addOperations(operations, waitUntilFinished:true)


let results = operations.map{$0.path}
let myPathSum = operations.map{$0.sum}

let tupple = zip(myPathSum,results)
let sort = tupple.sorted{$0.0 < $1.0}
let weights = sort.map{$0.0}
let pathts = sort.map{$0.1}

printMatrix(x)
print("Least Path: \(pathts[0])")
print("Weight: \(weights[0])")

