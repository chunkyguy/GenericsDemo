//: Playground - noun: a place where people can play

import UIKit

protocol ShapeImplementable {
    var area: Double { get }
}

struct RectangleImpl: ShapeImplementable {
    var area: Double {
        return width * height
    }

    init(w: Double, h: Double) {
        width = w
        height = h
    }

    private let width: Double
    private let height: Double
}

struct CircleImpl: ShapeImplementable {
    var area: Double {
        return 3.14 * radius * radius
    }

    init(r: Double) {
        radius = r
    }

    private let radius: Double
}

struct TriangleImpl: ShapeImplementable {
    var area: Double {
        return 0.5 * base * height
    }

    init(b: Double, h: Double) {
        base = b
        height = h
    }

    private let base: Double
    private let height: Double
}

struct Shape<Impl: ShapeImplementable> {
    private let implementation: ShapeImplementable

    init(impl: ShapeImplementable) {
        implementation = impl
    }

    func printArea() {
        println("area = \(implementation.area)")
    }
}

let rect = Shape<RectangleImpl>(impl: RectangleImpl(w: 10, h: 20))
let circle = Shape<CircleImpl>(impl: CircleImpl(r: 5))
let triangle = Shape<TriangleImpl>(impl: TriangleImpl(b: 10, h: 5))

rect.printArea()
circle.printArea()
triangle.printArea()
