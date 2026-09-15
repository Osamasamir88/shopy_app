import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/product_details/presentation/views/widgets/add_to_cart_button.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.productPrice});
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(thickness: .4),
            SizedBox(height: 20.h),
            // price & add to cart
            Row(
              children: [
                // price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price', style: AppTextStyles.font16Regular),
                    Text(
                      '\$ $productPrice',
                      style: AppTextStyles.font32SemiBold.copyWith(
                        fontSize: 24.h,
                      ),
                    ),
                  ],
                ),

                Spacer(),
                // add to cart
                AddToCartButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
