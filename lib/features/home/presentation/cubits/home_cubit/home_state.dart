part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final String selectedCategory;

  HomeSuccessState({
    required this.products,
    required this.categories,
    required this.selectedCategory,
  });
}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState({required this.errMessage});
}
