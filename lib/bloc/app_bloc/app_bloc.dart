import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_tracker/bloc/app_bloc/app_bloc_files.dart';
import 'package:care_tracker/models/custom_exceptions.dart';
import 'package:care_tracker/models/user.dart';
import 'package:care_tracker/repositories/auth_repository.dart';
import 'package:care_tracker/repositories/database_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository authRepository;
  late DatabaseRepository databaseRepository;
  late UserData user;

  AppBloc({required this.authRepository})
      : super(Uninitialized(user: UserData.empty)) {
    user = authRepository.getUserData;
    databaseRepository = DatabaseRepository(uid: user.uid);
    on<AppStarted>(_onAppStarted);
    on<LoginUser>(_onLoginUser);
    on<SignupUser>(_onSignupUser);
    on<LogoutUser>(_onLogoutUser);
  }

  // When the App Starts
  FutureOr<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(Uninitialized(user: UserData.empty));
    try {
      user = authRepository.getUserData;
      if (user != UserData.empty) {
        // Authenticated
        // Update DatabaseRepository
        databaseRepository = DatabaseRepository(uid: user.uid);
        // Fetch rest of the user details from database
        UserData completeUserData = await databaseRepository.completeUserData;
        if (completeUserData != UserData.empty) {
          // if db fetch is successful
          user = completeUserData;
          emit(Authenticated(user: user));
        } else {
          // if db fetch fails
          emit(const ErrorOccurred(error: 'Failed to fetch details!'));
        }
      } else {
        emit(Unauthenticated(user: user));
      }
    } catch (e) {
      // If something goes wrong
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  // When the App Starts
  FutureOr<void> _onLoginUser(LoginUser event, Emitter<AppState> emit) async {
    emit(LoginPageState.loading);
    try {
      // Login using email and password
      user = await authRepository.logInWithCredentials(
          event.email, event.password);
      // Update DatabaseRepository
      databaseRepository = DatabaseRepository(uid: user.uid);
      // After login fetch rest of the user details from database
      UserData completeUserData = await databaseRepository.completeUserData;
      if (completeUserData != UserData.empty) {
        // if db fetch is successful
        user = completeUserData;
        emit(Authenticated(user: user));
      } else {
        // if db fetch fails
        emit(const ErrorOccurred(error: 'Failed to fetch details!'));
      }
    } catch (e) {
      if (e is UserNotFoundException) {
        emit(LoginPageState.noUserFound);
      } else if (e is WrongPasswordException) {
        emit(LoginPageState.wrongPassword);
      } else {
        emit(LoginPageState.somethingWentWrong);
      }
    }
  }

  // When the User Signs up
  FutureOr<void> _onSignupUser(SignupUser event, Emitter<AppState> emit) async {
    emit(SignupPageState.loading);
    try {
      // Signup using email and password
      user = await authRepository.signupWithCredentials(
          event.email, event.password);
      // Update DatabaseRepository
      databaseRepository = DatabaseRepository(uid: user.uid);
      // Upload Profile Pic
      String photoUrl = '';
      if (event.image != null) {
        // Upload new image to Firebase storage
        String? res = await databaseRepository.uploadFile(event.image!);
        if (res != null) {
          photoUrl = res;
        } else {
          photoUrl =
              'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg';
        }
      } else {
        // Default profile pic
        photoUrl =
            'https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg';
      }
      // Add User details to db
      UserData newUser = UserData(
        uid: user.uid,
        email: event.email,
        name: event.name,
        phone: event.phone,
        photoUrl: photoUrl,
      );
      databaseRepository.updateUser(newUser);
      user = newUser;
      emit(Authenticated(user: user));
    } catch (e) {
      if (e is EmailAlreadyInUseException) {
        emit(SignupPageState.userAlreadyExists);
      } else {
        emit(SignupPageState.somethingWentWrong);
      }
      emit(Unauthenticated(user: user));
    }
  }

  FutureOr<void> _onLogoutUser(LogoutUser event, Emitter<AppState> emit) async {
    emit(Uninitialized(user: user));
    user = UserData.empty;
    databaseRepository = DatabaseRepository(uid: '');
    await authRepository.signOut();
    emit(Unauthenticated(user: user));
  }
}
