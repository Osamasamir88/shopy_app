import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/Core/routing/app_routes.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_rich_text.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Login to your account',
                      style: AppTextStyles.font32SemiBold,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'It’s great to see you again.',
                      style: AppTextStyles.font16Regular,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'User Name',
                      hint: 'Enter your email address',
                      keboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      isPassword: true,
                      keboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 55.h),
                    Center(
                      child: CustomElevatedButton(
                        text: '/Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Call Login Cubit here
                            // الانتقال مؤقتا لشاشه ال home لحد ما نعمل اللوجيك بتاع تسجيل الدخول
                            context.pushReplacement(AppRoutes.homeView);
                          }
                        },
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: CustomRichText(
                        text1: 'Don’t have an account? ',
                        text2: 'Join',
                        path: AppRoutes.registerView,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
