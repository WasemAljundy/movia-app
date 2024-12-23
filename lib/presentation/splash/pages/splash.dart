import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/helpers/navigation/app_navigation.dart';
import 'package:netflix_app/core/configs/assets/app_images.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';
import 'package:netflix_app/presentation/auth/pages/sign_in.dart';
import 'package:netflix_app/presentation/home/pages/home.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // AppNavigator.pushReplacement(context, SignInPage());
            AppNavigator.pushReplacement(context, const HomePage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          }  
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.splashBackground,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.secondBackground.withOpacity(0),
                    AppColors.secondBackground,
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
