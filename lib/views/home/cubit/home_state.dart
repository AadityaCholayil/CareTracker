part of 'home_cubit.dart';

class HomeState extends Equatable {
  final UserData user;

  const HomeState({this.user = const UserData.init()});

  HomeState copyWith({
    UserData? user,
  }) {
    return HomeState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];
}
