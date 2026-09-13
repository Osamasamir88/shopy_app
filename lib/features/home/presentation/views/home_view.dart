import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/Core/di/service_locator.dart';
import 'package:shopy_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:shopy_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:shopy_app/features/product_details/data/repos/home_repo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(getIt<HomeRepo>())..getHomeProducts(),
        child: const HomeViewBody(),
      ),
    );
  }
}
