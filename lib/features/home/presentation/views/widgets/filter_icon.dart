import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h, // توحيد الارتفاع مع الـ SearchBar
      width: 52.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.filter_list_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }
}

