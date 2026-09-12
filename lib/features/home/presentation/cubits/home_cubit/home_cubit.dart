import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopy_app/features/product_details/data/models/category_model.dart';
import 'package:shopy_app/features/product_details/data/models/product_model.dart';
import 'package:shopy_app/features/product_details/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  String selectedCategory = 'All';

  Future<void> getHomeProducts() async {
    emit(HomeLoadingState()); // 1. أبلغ الشاشة إننا بنحمل دلوقتي

    // 2. اطلب الأقسام والمنتجات من الـ Repo في نفس الوقت
    final productsReslut = await homeRepo.getProducts();
    final categoriesReslut = await homeRepo.getCategories();

    // 3. افحص نتيجة الأقسام
    categoriesReslut.fold(
      (failure) => emit(HomeFailureState(errMessage: failure.errMassage)),
      (categoriesList) {
        categories = categoriesList;
        // 4. طالما الأقسام نجحت، نفحص المنتجات
        productsReslut.fold(
          (failure) => emit(HomeFailureState(errMessage: failure.errMassage)),
          (productsList) {
            products = productsList;
            // 5. الاثنين نجحوا! انبعث حالة Success ومعاها كل الداتا للـ UI
            emit(
              HomeSuccessState(
                products: products,
                categories: categories,
                selectedCategory: selectedCategory,
              ),
            );
          },
        );
      },
    );
  }

  // ميثود الفلترة عند تغيير الـ Category
  fliterByCategory(String categoryName) async {
    selectedCategory = categoryName;// تحديث القسم المختار
    emit(HomeLoadingState()); // إظهار تحمّيل جديد للمنتجات فقط
    // اطلب من الـ Repo جلب منتجات هذا القسم فقط من Strapi
    final reslut = await homeRepo.getProducts(categoryName: categoryName);
    reslut.fold(
      (failure) => emit(HomeFailureState(errMessage: failure.errMassage)),
      (filterdProduct) {
        products = filterdProduct; // تحديث قائمة المنتجات بالجديد
        emit(
          HomeSuccessState(
            products: products,
            categories: categories,
            selectedCategory: selectedCategory,
          ),
        );
      },
    );
  }
}
