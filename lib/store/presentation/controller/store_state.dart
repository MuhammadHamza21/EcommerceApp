// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'store_cubit.dart';

class StoreState extends Equatable {
  final RequestState gettingFeaturedProductsState;
  final RequestState gettingPopularProductsState;
  const StoreState({
    this.gettingFeaturedProductsState = RequestState.initial,
    this.gettingPopularProductsState = RequestState.initial,
  });
  @override
  List<Object?> get props => [
        gettingFeaturedProductsState,
        gettingPopularProductsState,
      ];
  StoreState copyWith({
    RequestState? gettingFeaturedProductsState,
    RequestState? gettingPopularProductsState,
  }) =>
      StoreState(
        gettingFeaturedProductsState:
            gettingFeaturedProductsState ?? this.gettingFeaturedProductsState,
        gettingPopularProductsState:
            gettingPopularProductsState ?? this.gettingPopularProductsState,
      );
}

final class StoreInitialState extends StoreState {}
