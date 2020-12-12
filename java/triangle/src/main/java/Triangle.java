class Triangle {
  private final double side1, side2, side3;

  private static boolean isValidTriangle(final double side1, final double s2, final double s3) {
    return side1 < s2 + s3 && s2 < side1 + s3 && s3 < side1 + s2;
  }

  Triangle(final double side1, final double side2, final double side3) throws TriangleException {
    if (!isValidTriangle(side1, side2, side3)) {
      throw new TriangleException();
    }
    this.side1 = side1;
    this.side2 = side2;
    this.side3 = side3;

  }

  boolean isEquilateral() {
    return side1 == side2 && side2 == side3;
  }

  boolean isIsosceles() {
    return side1 == side2 || side2 == side3 || side1 == side3;
  }

  boolean isScalene() {
    return !isIsosceles();
  }

}
