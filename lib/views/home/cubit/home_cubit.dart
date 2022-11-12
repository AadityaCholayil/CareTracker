import 'package:care_tracker/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  UserData user;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  HomeCubit({required this.user}) : super(const HomeState());

  void onStepCount(StepCount event) {
    /// Handle step count changed
    int steps = event.steps;
    emit(state.copyWith(user: state.user.copyWith(steps: steps)));
    print(steps);
    DateTime timeStamp = event.timeStamp;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    /// Handle status changed
    String status = event.status;
    DateTime timeStamp = event.timeStamp;
    print(status);
  }

  void onPedestrianStatusError(error) {
    /// Handle the error
    print(error);
  }

  void onStepCountError(error) {
    /// Handle the error
    print(error);
  }

  Future<void> initPlatformState() async {
    /// Init streams
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _stepCountStream = Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }

  void getData() async {
    emit(state.copyWith(user: user));
    initPlatformState();
    // while (!isClosed) {
    //   await Future.delayed(Duration(milliseconds: 5000));
    //   print('hi');
    // }
  }
}
