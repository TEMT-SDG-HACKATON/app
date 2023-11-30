class AppService {
  int? _selectedPageIndex;

  int get selectedPageIndex => _selectedPageIndex ?? 0;

  void selectPageIndex(int value) {
    _selectedPageIndex = value;
  }
}
