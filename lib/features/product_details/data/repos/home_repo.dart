import 'package:dartz/dartz.dart';
import 'package:shopy_app/Core/errors/failure.dart';
import 'package:shopy_app/features/product_details/data/models/category_model.dart';
import 'package:shopy_app/features/product_details/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts({
    String? categoryName,
    String? searchQuery,
  });
  
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}