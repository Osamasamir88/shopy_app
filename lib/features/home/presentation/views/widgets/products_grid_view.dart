import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الكروت في الف الواحد
        crossAxisSpacing: 16.w, // مسافة أفقيّة بين الكروت
        mainAxisSpacing: 16.h, // مسافة رأسيّة بين الكروت
        childAspectRatio: 0.7, //  نسبة العرض للارتفاع لمنع الـ Overflow
      ),
      itemBuilder: (context, index) => const ProductItem(),
    );
  }
}
