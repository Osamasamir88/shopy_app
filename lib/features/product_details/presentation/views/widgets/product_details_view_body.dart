import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_colors.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/product_details/data/models/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صوره المنتج
            SizedBox(
              height: 368.5.h,
              child: PageView.builder(
                controller: pageController,
                itemCount: widget.product.images.length,
                itemBuilder: (BuildContext context, int index) {
                  // 💡 لو الصورة الأولى هي اللي بتظهر في الهوم، يفضل نربط الـ Hero بالصورة الأولى أو بكل الصور لو حابب
                  final isFirstImage = index == 0;
                  Widget imageWidget = CachedNetworkImage(
                    imageUrl: widget.product.images[index],
                    fit: BoxFit.contain,
                  );

                  // بنحط الـ Hero على الصورة الأولى (اللي غالباً بتبقى ظاهرة في الكارت برة)
                  if (isFirstImage) {
                    return Hero(
                      tag: widget
                          .product
                          .id.toString(), // 👈 لازم نفس الـ tag تماماً اللي في الكارت
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[150],
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: imageWidget,
                        ),
                      ),
                    );
                  }
                  // باقي الصور العادية من غير Hero عشان ميعصلش تعارض في الـ tags
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: Colors
                          .grey[100], // خلفية خفيفة تملى أي مساحة فاضية بشكل أنيق
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: imageWidget,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 12.h),

            // dots indicator
            if (widget.product.images.length > 1)
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: widget.product.images.length,
                  effect: JumpingDotEffect(
                    activeDotColor: AppColors.primary,
                    jumpScale: 2,
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                  ),
                ),
              ),

            SizedBox(height: 12.h),
            // اسم المنتج
            Text(
              widget.product.title,
              style: AppTextStyles.font16semiBold.copyWith(fontSize: 24.sp),
            ),

            SizedBox(height: 13.h),

            // تقييم المنتج
            Row(
              children: [
                Icon(Icons.star, color: AppColors.yellow),
                SizedBox(width: 6.w),
                Text(
                  '${widget.product.rating}',
                  style: AppTextStyles.font16Medium,
                ),
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
              widget.product.description,
              style: AppTextStyles.font16semiBold.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.grey500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
