import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/Core/routing/app_routes.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_rich_text.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errMessage),
                        backgroundColor: Colors.red,
                        duration:const Duration(seconds: 2),
                      ),
                    );
                  }
                  if (state is LoginSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Welcome Back, ${state.authResponse.user.username}',
                        ),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    // تأخير الانتقال لحين عرض الـ SnackBar
                    Future.delayed(const Duration(seconds: 3), () {
                      if (context.mounted) {
                        context.pushReplacement(AppRoutes.homeView);
                      }
                    });
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: loginCubit.loginFormKey,
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
                          controller: loginCubit.emailController,
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
                          controller: loginCubit.passwordController,
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
                            child: state is LoginLoadingState
                                ? Center(child: CircularProgressIndicator())
                                : Text(
                                    'Login',
                                    style: AppTextStyles.font14Medium,
                                  ),
                            onPressed: () {
                              // بنقفل الـ onPressed لو الحالة Loading عشان نمنع الضغط المتكرر
                              state is LoginLoadingState
                                  ? null
                                  : loginCubit.login();
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
