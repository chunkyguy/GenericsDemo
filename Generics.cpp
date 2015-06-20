#include <iostream>

class RectangleImpl {
public:
    RectangleImpl(float w, float h) : width(w), height(h) {}

    float Area() const {
        return width * height;
    }

private:
    float width, height;
};

class CircleImpl {
public:
    CircleImpl(float r) : radius(r) {}

    float Area() const {
        return 3.14 * (radius * radius);
    }

private:
    float radius;
};

class TriangleImpl {
public:
    TriangleImpl(float b, float h) : base(b), height(h) {}

    float Area() const {
        return 0.5 * base * height;
    }

private:
    float base, height;
};

template <typename Impl>
class Shape {
public:
    Shape(const Impl impl) : implementation(impl) {}

    void PrintArea() const {
        std::cout << "area = " << implementation.Area() << std::endl;
    }

private:
    const Impl implementation;
};

int main() {

    Shape<RectangleImpl> rect(RectangleImpl(10, 20));
    Shape<CircleImpl> circle(CircleImpl(5));
    Shape<TriangleImpl> triangle(TriangleImpl(10, 5));

    rect.PrintArea();
    circle.PrintArea();
    triangle.PrintArea();

    return 0;
}
