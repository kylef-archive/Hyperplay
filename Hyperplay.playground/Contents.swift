import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

import Representor
import Hyperdrive
import RxHyperdrive


let hyperdrive = Hyperdrive()
hyperdrive.enter("http://localhost:8000/")
   // Follow the `questions` transition
  .flatMap { hyperdrive.request($0.transitions["questions"]) }
  .subscribeNext {
    let transitions = $0.transitions.keys.joinWithSeparator(", ")
    print("Available transitions:", transitions)
  }