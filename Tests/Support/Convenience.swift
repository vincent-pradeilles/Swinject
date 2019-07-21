//
//  Copyright © 2019 Swinject Contributors. All rights reserved.
//

import Nimble
@testable import Swinject

extension InstanceMaker where Argument == Void, Context == Any {
    func makeInstance(resolver: Resolver3) throws -> MadeType {
        try makeInstance(arg: (), context: (), resolver: resolver)
    }
}

extension InstanceMaker where Argument == Void {
    func makeInstance(context: Context, resolver: Resolver3) throws -> MadeType {
        try makeInstance(arg: (), context: context, resolver: resolver)
    }
}

extension InstanceMaker where Context == Any {
    func makeInstance(arg: Argument, resolver: Resolver3) throws -> MadeType {
        try makeInstance(arg: arg, context: (), resolver: resolver)
    }
}

func concurrentPerform(iterations: Int, action: () -> Void) {
    var finished = 0
    DispatchQueue.concurrentPerform(iterations: iterations) { _ in
        action()
        finished += 1
    }
    waitUntil { done in
        if finished == iterations { done() }
    }
}
