import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: BoxConstraints(maxHeight: 52.h, minHeight: 52.h), // توحيد الارتفاع
      elevation: const WidgetStatePropertyAll(
        0,
      ), // إلغاء الظل لو حابب
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 20.w),
      ),
      backgroundColor: WidgetStatePropertyAll(
        AppColors.backgroundLight,
      ),
      leading: Icon(Icons.search, color: AppColors.grey400),
      hintText: 'Search for clothes...',
      hintStyle: WidgetStatePropertyAll(
        AppTextStyles.font16Regular,
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(color: AppColors.lightgrey),
          borderRadius: BorderRadius.circular(
            10.r,
          ), // توحيد الـ Radius مع زر الفلتر
        ),
      ),
    );
  }
}
