import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/category_name.dart';
import 'package:shopy_app/features/product_details/data/models/category_model.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0; // 👈 متابعة العنصر المختار (الافتراضي: All)

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final cubit = context.read<HomeCubit>();
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              // هنا هننادي الـ Cubit لاحقاً لفلترة المنتجات حسب الـ Category
              cubit.fliterByCategory(widget.categories[index].name);
            },
            child: CategoryItem(
              categoryName: widget.categories[index].name,
              isSelected: cubit.selectedCategory == widget.categories[index].name,
            ),
          );
        },
      ),
    );
  }
}
