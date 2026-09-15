import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/filter_icon.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Text('Discover', style: AppTextStyles.font32SemiBold),
            SizedBox(height: 16.h),
            // Search & filtering
            Row(
              children: [
                Expanded(child: CustomSearchBar()),
                SizedBox(width: 8.w),
                FilterIcon(),
              ],
            ),

            SizedBox(height: 16.h),

            // category list & products
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await context.read<HomeCubit>().getHomeProducts();
                },
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState || state is HomeInitial) {
                      return Center(child: CircularProgressIndicator());
                      // return Expanded(
                      //   child: Skeletonizer(
                      //     enabled: true,
                      //     child: Column(
                      //       children: [
                      //         // 👈 ممكن نحط هنا لستة وهمية للأقسام عشان الـ Skeleton يشملها برضه
                      //         CategoriesListView(
                      //           categories: [
                      //             CategoryModel(id: 1, name: 'All'),
                      //             CategoryModel(id: 2, name: 'T-Shirts'),
                      //             CategoryModel(id: 3, name: 'Shoes'),
                      //           ],
                      //         ),
                      //         SizedBox(height: 24.h),
                      //         Expanded(
                      //           child: _buildProductGrid(context, [], isDummy: true),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
                    }

                    if (state is HomeSuccessState) {
                      return Column(
                        children: [
                          CategoriesListView(categories: state.categories),
                          SizedBox(height: 24.h),
                          Expanded(
                            child: _buildProductGrid(
                              context,
                              state.products,
                              isDummy: false,
                            ),
                          ),
                        ],
                      );
                    }

                    if (state is HomeFailureState) {
                      return CustomErrorWidget(errMessage: state.errMessage,);
                    }

                    return SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method لبناء الـ GridView ونظافة الكود
  Widget _buildProductGrid(
    BuildContext context,
    List products, {
    bool isDummy = false,
  }) {
    final itemCount = isDummy ? 6 : products.length;

    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        final product = isDummy ? null : products[index];
        return ProductItem(
          productModel: product,
        ); // تمرير المنتج الحقيقي للكارت
      },
    );
  }
}

