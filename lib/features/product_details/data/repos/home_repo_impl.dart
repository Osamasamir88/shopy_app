import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopy_app/Core/api/api_service.dart';
import 'package:shopy_app/Core/errors/failure.dart';
import 'package:shopy_app/features/product_details/data/models/category_model.dart';
import 'package:shopy_app/features/product_details/data/models/product_model.dart';
import 'package:shopy_app/features/product_details/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final  ApiService apiService;
  const HomeRepoImpl(this.apiService);

  // 2️⃣ جلب الأقسام (Categories)
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
    final response = await apiService.get(endpoint: 'categories');
    final List data = response['data'];

    final categories = data.map((e) => CategoryModel.fromJson(e)).toList();

    // إضافة قسم 'All' افتراضياً في البداية
    categories.insert(0, CategoryModel(id: 0, name: 'All'));

    return Right(categories);
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
  }

  // 1️⃣ جلب المنتجات (مع الصور والـ Category)
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts({
    String? categoryName,
    String? searchQuery,
  }) async {
    try {
    String endpoint = 'products?populate=*';

    // إضافة الفلترة لو اخترنا Category معين مش 'All'
    if (categoryName != null && categoryName != 'All') {
      endpoint += '&filters[category][name][\$eq]=$categoryName';
    }

    // إضافة البحث بالاسم
    if (searchQuery != null && searchQuery.isNotEmpty) {
      endpoint += '&filters[title][\$containsi]=$searchQuery';
    }

    final response = await apiService.get(endpoint: endpoint);
    final List data = response['data'];
    final products = data.map((e) => ProductModel.fromJson(e)).toList();

    return Right(products);
  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return Left(ServerFailure(e.toString()));
  }
  }
}


