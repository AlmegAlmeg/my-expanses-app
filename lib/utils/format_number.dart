String fromatNumber(double number) {
  if (number % 1 == 0) {
    return number.toStringAsFixed(0);
  }
  return number.toString();
}
