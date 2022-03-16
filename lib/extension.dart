extension DisplayNumber on double {
  String toDisplay() => this == toInt() ? toStringAsFixed(0) : toString();
}
