import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/Core/di/service_locator.dart';
import 'package:shopy_app/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:shopy_app/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => getIt<RegisterCubit>(),
        child: RegisterViewBody(),
      ),
    );
  }
}
