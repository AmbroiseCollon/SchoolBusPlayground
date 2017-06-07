import UIKit
class AnimationQueue {
    private var queue = [Animation]()
    private var isExecuting = false

    internal func addAnimation(block: @escaping () -> ()) {
        queue.append(Animation(block: block))
        execute()
    }


    internal func addPause() {
        queue.append(Animation(isPause: true))
        execute()
    }

    private func execute() {
        if shouldExecute {
            isExecuting = true
            let animation = self.queue.removeFirst()

            if animation.isPause {
                runPause()
            } else {
                run(animation: animation)
            }
        }
    }

    private var shouldExecute: Bool {
        return !isExecuting && queue.count > 0
    }

    private func runPause() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.isExecuting = false
            self.execute()
        }
    }

    private func run(animation: Animation) {
        if let block = animation.block {
            UIView.animate(withDuration: 0.6, delay: 0, options: [.curveLinear], animations: block) { (completed) in
                if completed {
                    self.isExecuting = false
                    self.execute()
                }
            }
        }

    }
}

struct Animation {
    var block: (() -> ())?
    var isPause = false

    init(block: @escaping (() -> ())) {
        self.block = block
    }

    init(isPause: Bool) {
        self.isPause = isPause
    }
}
