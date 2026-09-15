import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/product_details/data/models/product_model.dart';
import 'package:shopy_app/features/product_details/presentation/views/widgets/add_to_cart_button.dart';
import 'package:shopy_app/features/product_details/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:shopy_app/features/product_details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: AppTextStyles.font32SemiBold.copyWith(fontSize: 24.sp),
        ),
      ),
      body: ProductDetailsViewBody(product: productModel),
      bottomNavigationBar: CustomBottomNavBar(
        productPrice: productModel.price.toString(),
      ),
    );
  }
}
