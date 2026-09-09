import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/category_name.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  final List<String> categoriesName = ['All', 'Tshirts', 'Jeans', 'Shoes'];
  int selectedIndex = 0; // 👈 متابعة العنصر المختار (الافتراضي: All)

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesName.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              // هنا هننادي الـ Cubit لاحقاً لفلترة المنتجات حسب الـ Category
            },
            child: CategoryItem(
              categoryName: categoriesName[index],
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
