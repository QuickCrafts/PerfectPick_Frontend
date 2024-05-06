import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:perfectpick_wa/data/repositories/auth/auth_repository.dart';
import 'package:perfectpick_wa/data/data_providers/client_declarator.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository =
      AuthRepository(client: graphqlClient.value);
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String? _token;

  String? get token => _token;

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'token', value: token);
    _token = token;
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await _secureStorage.read(key: 'token');
    print(_token);
    int? userID;
    try {
      userID = await _authRepository.verifyID(_token!);
      print(userID);
      notifyListeners();
    } catch (e) {
      print("Error: $e");
      print(_token);
    }
  }

  Future<void> removeToken() async {
    await _secureStorage.delete(key: 'token');
    _token = null;
    notifyListeners();
  }
}
