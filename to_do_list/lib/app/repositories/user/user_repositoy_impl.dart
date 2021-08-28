import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/app/expection/auth_exception.dart';
import 'package:to_do_list/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth}) : _firebaseAuth = FirebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredencial.user;
    } on FirebaseAuthException catch (e,s) {
      print(e);
      print(s);
      if(e.code == 'email-already-in-use'){
        final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if(loginTypes.contains('password')){
          throw AuthException(message: 'Email já utilizado, por favor escolha outro e-mail');
        }else {
          throw AuthException(message: 'Você se cadastrou do TodoList pelo Google, por favor utilize ele para entrar!');
        }
      }else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    }
  }
}
