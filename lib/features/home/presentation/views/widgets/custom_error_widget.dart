import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints
                .maxHeight, // 👈 بياخد نفس مساحة الشاشة المتاحة عشان الـ Refresh يعمل سحب كويس
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    errMessage,
                    style: AppTextStyles.font32SemiBold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  // (اختياري) زر إعادة محاولة لسهولة الاستخدام بجانب السحب
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().getHomeProducts();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
