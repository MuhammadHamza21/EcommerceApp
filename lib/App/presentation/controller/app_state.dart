// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

class AppState extends Equatable {
  final RequestState changingCurrentIndexState;
  final RequestState accessTokenState;
  final RequestState refreshTokenState;
  const AppState({
    this.changingCurrentIndexState = RequestState.initial,
    this.accessTokenState = RequestState.initial,
    this.refreshTokenState = RequestState.initial,
  });
  @override
  List<Object?> get props =>
      [changingCurrentIndexState, accessTokenState, refreshTokenState];

  AppState copyWith({
    RequestState? changingCurrentIndexState,
    RequestState? accessTokenState,
    RequestState? refreshTokenState,
  }) =>
      AppState(
        changingCurrentIndexState:
            changingCurrentIndexState ?? this.changingCurrentIndexState,
        accessTokenState: accessTokenState ?? this.accessTokenState,
        refreshTokenState: refreshTokenState ?? this.refreshTokenState,
      );
}

final class AppInitialState extends AppState {}
