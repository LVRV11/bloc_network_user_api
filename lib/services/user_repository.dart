import 'package:bloc_network_user_api/models/user.dart';
import 'package:bloc_network_user_api/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
