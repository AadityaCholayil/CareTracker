import 'package:firebase_auth/firebase_auth.dart';
import 'package:care_tracker/models/custom_exceptions.dart';
import 'package:care_tracker/models/user.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Login using email and password
  Future<UserData> logInWithCredentials(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user == null ? UserData.empty : UserData.fromUser(user);
    } on FirebaseAuthException catch (e) {
      // throw custom exceptions that can be handled in AppBloc
      print(e.code);
      switch (e.code) {
        case 'user-not-found':
          throw UserNotFoundException();
        case 'wrong-password':
          throw WrongPasswordException();
        default:
          throw SomethingWentWrongException();
      }
    } catch (_) {
      throw SomethingWentWrongException();
    }
  }

  // Signup using email and password
  Future<UserData> signupWithCredentials(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user == null ? UserData.empty : UserData.fromUser(user);
    } on FirebaseAuthException catch (e) {
      // throw custom exceptions that can be handled in AppBloc
      print(e.code);
      switch (e.code) {
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        default:
          throw SomethingWentWrongException();
      }
    } catch (_) {
      throw SomethingWentWrongException();
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on Exception catch (_) {
      // Throw custom exceptions that can be handled in AppBloc
      throw SignOutFailure();
    }
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  UserData get getUserData {
    User? user = _firebaseAuth.currentUser;
    return user == null ? UserData.empty : UserData.fromUser(user);
  }
}
