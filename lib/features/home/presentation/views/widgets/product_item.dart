import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // هنا هنحط لوجيك الانتقال لشاشه product details
      },
      child: SizedBox(
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/tshirt.png',
                width: 161.w,
                height: 174.h,
              ),
            ),
            SizedBox(height: 8.h),
            Text('Fit Polo T Shirt', style: AppTextStyles.font16semiBold),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$ 1,190', style: AppTextStyles.font12Medium),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    // هنا هننادي الـ WishlistCubit لاحقاً لربطها بالـ API
                  },
                  child: AnimatedScale(
                    scale: isFavorite ? 1.1 : 1.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInExpo,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 25.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
