import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/product_details/presentation/views/widgets/add_to_cart_button.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صوره المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset('assets/tshirt.png'),
          ),
    
          SizedBox(height: 12.h),
          // اسم المنتج
          Text(
            'Fit Polo T Shirt',
            style: AppTextStyles.font16semiBold.copyWith(fontSize: 24.sp),
          ),
    
          SizedBox(height: 13.h),
    
          // تقييم المنتج
          Row(
            children: [
              Icon(Icons.star, color: AppColors.yellow),
              SizedBox(width: 6.w),
              Text('4.0/5 ', style: AppTextStyles.font16Medium),
              Text(
                '(45 reviews)',
                style: AppTextStyles.font16Medium.copyWith(
                  color: AppColors.grey500,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.w),
          // وصف المنتج
          Text(
            'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
            style: AppTextStyles.font16semiBold.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.grey500,
            ),
          ),
          
          Spacer(),
          //
          Divider(thickness: .4),
          SizedBox(height: 20.h),
          // price & add to cart
          Row(
            children: [
              // price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price',style: AppTextStyles.font16Regular,), 
                  Text('\$ 1,190',style: AppTextStyles.font32SemiBold.copyWith(fontSize: 24.h),), 
                ],
              ),
              Spacer(),
              // add to cart
              AddToCartButton(),
            ],
          ),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}

