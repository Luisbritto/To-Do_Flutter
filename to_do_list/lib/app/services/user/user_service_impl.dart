import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/app/repositories/user/user_repository.dart';
import 'package:to_do_list/app/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository}) : _userRepository = UserRepository;

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);
}