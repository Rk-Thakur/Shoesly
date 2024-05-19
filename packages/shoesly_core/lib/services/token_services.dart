import 'package:hive/hive.dart';

enum CacheManagerKey {
  onBoard,
}

class TokenService {
  factory TokenService() => _instance;
  TokenService._internal();
  static final TokenService _instance = TokenService._internal();
  late final Box<bool> _onBoardBox;

  Future<void> initializeHive() async {
    _onBoardBox = Hive.box('onBoardBox');
  }

  Future<bool> saveOnboard() async {
    await _onBoardBox.put(CacheManagerKey.onBoard.toString(), true);
    return true;
  }

  Future<bool?>? getOnBoard() async {
    return _onBoardBox.get(CacheManagerKey.onBoard.toString());
  }
}
