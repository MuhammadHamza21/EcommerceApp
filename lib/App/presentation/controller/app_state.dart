// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

class AppState extends Equatable {
  final RequestState changingCurrentIndexState;
  const AppState({
    this.changingCurrentIndexState = RequestState.initial,
  });
  @override
  List<Object?> get props => [changingCurrentIndexState];

  AppState copyWith({
    RequestState? changingCurrentIndexState,
  }) =>
      AppState(
        changingCurrentIndexState:
            changingCurrentIndexState ?? this.changingCurrentIndexState,
      );
}

final class AppInitialState extends AppState {}
