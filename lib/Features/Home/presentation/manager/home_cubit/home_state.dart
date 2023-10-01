part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class ChangeBottomNavBarLoadingState extends HomeState {}
final class ChangeBottomNavBarSuccessState extends HomeState {}


final class NewPostState extends HomeState {}

final class GetUserDataLoadingState extends HomeState {}

final class GetUserDataSuccessState extends HomeState {}

final class GetUserDataFailureState extends HomeState {}
