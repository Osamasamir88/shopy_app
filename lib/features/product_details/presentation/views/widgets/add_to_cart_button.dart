import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // هنا هنضيف لوجيك اضافه للسله
      },
      child: Container(
        width: 240.w,
        height: 54.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined,color: Colors.white,),
            SizedBox(width: 10.w,),
            Text('Add to Cart',style: AppTextStyles.font16Medium.copyWith(color: AppColors.white),)
          ],
        ),
      ),
    );
  }
}
