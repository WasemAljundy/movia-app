import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/presentation/splash/bloc/splash_state.dart';
import 'package:netflix_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<AuthRepository>().isLoggedIn();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(
        UnAuthenticated(),
      );
    }
  }
}
