import 'package:ecommerce_app/features/auth/repository/user_repository.dart';
import 'package:ecommerce_app/features/splash/cubit/startup_cubit.dart';
import 'package:ecommerce_app/features/splash/ui/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StartupCubit(userRepository: context.read<UserRepository>())..init(),
      child: const SplashWidget(),
    );
  }
}
