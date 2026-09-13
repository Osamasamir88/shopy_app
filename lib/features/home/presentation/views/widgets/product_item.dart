import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/Core/routing/app_routes.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/product_details/data/models/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel? productModel;

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
        context.push(AppRoutes.productDetailsView);
      },
      child: SizedBox(
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    widget.productModel?.mainImage ??
                    'https://via.placeholder.com/150',
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => const SizedBox.shrink(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 161.w,
                height: 174.h,
              ),
              // Image.asset(
              //   widget.productModel!.mainImage,
              //   width: 161.w,
              //   height: 174.h,
              // ),
            ),
            SizedBox(height: 8.h),
            Text(
              widget.productModel?.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font16semiBold,
            ),
            SizedBox(height: 3.h),
            // price & add to fav
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${widget.productModel?.price}',
                  style: AppTextStyles.font12Medium,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    // هنا هننادي الـ WishlistCubit لاحقاً لربطها بالـ API
                  },
                  child: AnimatedScale(
                    scale: isFavorite ? 1.2 : 1.0,
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
