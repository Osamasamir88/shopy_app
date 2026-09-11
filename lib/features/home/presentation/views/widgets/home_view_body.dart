import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/filter_icon.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/products_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Text('Discover', style: AppTextStyles.font32SemiBold),
            SizedBox(height: 16.h),
            // Search & filtering
            Row(
              children: [
                Expanded(child: CustomSearchBar()),
                SizedBox(width: 8.w),
                FilterIcon(),
              ],
            ),

            SizedBox(height: 16.h),
            CategoriesListView(),
            SizedBox(height: 24.h),
            Expanded(
              child: ProductsGridView(),
            ),
          ],
        ),
      ),
    );
  }
}

