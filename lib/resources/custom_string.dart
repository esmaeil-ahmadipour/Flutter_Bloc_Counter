class CustomString {
  CustomString._();

  static final CustomString _ourInstance = new CustomString._();

  static CustomString getInstance() {
    return _ourInstance;
  }

  final String _mainAppbarTitle = "Flutter State Manager";

  String get mainAppbarTitle => _mainAppbarTitle;

  final String _blocBtnTitle = "Bloc";

  String get blocBtnTitle => _blocBtnTitle;

  final String _confirmTitle = "Confirm";

  String get confirmTitle => _confirmTitle;

  final String _detailTitle = "Detail";

  String get detailTitle => _detailTitle;
}
