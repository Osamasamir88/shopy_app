import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/Core/routing/app_routes.dart';
import 'package:shopy_app/Core/utils/app_text_styles.dart';
import 'package:shopy_app/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_rich_text.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/custom_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final regiterCubit = context.read<RegisterCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterFailureState) {
                   AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.bottomSlide,
                      title: 'Error ❌',
                      desc: state.errMessage,
                      btnOkOnPress: () {},
                      btnOkColor: Colors.red,
                    ).show();
                  }
                  if (state is RegisterSuccessState) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.scale,
                      title: 'Success 🎉',
                      desc: 'Account created successfully! Welcome, ${state.authResponse.user.username} 🎉',
                      autoHide: const Duration(
                        seconds: 2,
                      ), // يقفل أوتوماتيك بعد ثانتين
                      onDismissCallback: (type) {
                        if (context.mounted) {
                          context.pushReplacement(
                            AppRoutes.homeView,
                          ); // التنقل بعد إغلاق الديالوج
                        }
                      },
                    ).show();
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: regiterCubit.registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          'Create an account',
                          style: AppTextStyles.font32SemiBold,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Let’s create your account.',
                          style: AppTextStyles.font16Regular,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextField(
                          label: 'Full Name',
                          hint: 'Enter your full name',
                          keboardType: TextInputType.name,
                          controller: regiterCubit.usernameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          label: 'User Name',
                          hint: 'Enter your email address',
                          keboardType: TextInputType.emailAddress,
                          controller: regiterCubit.emailController,
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
                          controller: regiterCubit.passwordController,
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
                        SizedBox(height: 16.h),
                        CustomTextField(
                          label: 'Confirm Password',
                          hint: 'Enter your password',
                          isPassword: true,
                          keboardType: TextInputType.visiblePassword,
                          controller: regiterCubit.confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != regiterCubit.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 55.h),
                        Center(
                          child: CustomElevatedButton(
                            child: state is RegisterLoadingState
                                ? CircularProgressIndicator()
                                : Text(
                                    'Create Account',
                                    style: AppTextStyles.font14Medium,
                                  ),
                            onPressed: () {
                              // بنقفل الـ onPressed لو الحالة Loading عشان نمنع الضغط المتكرر
                              state is RegisterLoadingState
                                  ? null
                                  : regiterCubit.register();
                            },
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: CustomRichText(
                            text1: 'Already have an account? ',
                            text2: 'Log In',
                            path: AppRoutes.loginView,
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
