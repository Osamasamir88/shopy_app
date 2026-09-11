import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: BoxConstraints(
        maxHeight: 52.h,
        minHeight: 52.h,
      ), // توحيد الارتفاع
      elevation: const WidgetStatePropertyAll(0), // إلغاء الظل لو حابب
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20.w)),
      backgroundColor: WidgetStatePropertyAll(AppColors.backgroundLight),
      leading: Icon(Icons.search, color: AppColors.grey400),
      hintText: 'Search for clothes...',
      hintStyle: WidgetStatePropertyAll(AppTextStyles.font16Regular),
      // 🎨 التحكم في شكل ولون البوردر حسب الحالة (Focused / Normal)
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
        if (states.contains(WidgetState.focused)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: AppColors.primary, // 👈 اللون أثناء الـ Focus
              width: 1.5.w,
            ),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            color: AppColors.lightgrey, // 👈 اللون الطبيعي بدون Focus
            width: 1.w,
          ),
        );
      }),
    );
  }
}
