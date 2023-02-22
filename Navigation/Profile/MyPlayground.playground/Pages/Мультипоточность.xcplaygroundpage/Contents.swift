import UIKit

let x = DispatchQueue.global()

x.async {               // асинхронное выполненнение, то есть блоки выполняются в разной очереди
    print("world")
}

x.async {
    print("Johny")
}

x.async(flags: .barrier) { // флаг, выполняющий блог в последнюю очередь
    print("done")
}
