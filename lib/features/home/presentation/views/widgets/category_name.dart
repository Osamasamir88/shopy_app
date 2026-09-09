import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.isSelected,
  });
  final String categoryName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 92.w),
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : null,
        borderRadius: BorderRadius.circular(10.r),
        border: isSelected ? null : Border.all(color: AppColors.lightgrey),
      ),
      child: Text(
        categoryName,
        style: AppTextStyles.font16Medium.copyWith(
          color: isSelected ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
