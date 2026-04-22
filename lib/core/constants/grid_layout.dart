class GridLayout {
  const GridLayout._();

  static const int columns = 7;
  static const int rows = 10;
  static const int itemsPerPage = columns * rows;
  static const int initialPageCount = 2;
  static const int initialBatchSize = itemsPerPage * initialPageCount;
  static const double spacing = 2;
  static const double cornerRadius = 7;
}
