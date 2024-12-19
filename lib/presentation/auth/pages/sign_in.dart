import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/common/helpers/navigation/app_navigation.dart';
import 'package:netflix_app/common/message/display_message.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/domain/auth/usecases/sign_in.dart';
import 'package:netflix_app/presentation/auth/pages/sign_up.dart';
import 'package:netflix_app/presentation/home/pages/home.dart';
import 'package:netflix_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(
              height: 30,
            ),
            _emailTextField(),
            const SizedBox(
              height: 20,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 60,
            ),
            _signInButton(context),
            const SizedBox(
              height: 10,
            ),
            _signUpText(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailTextField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SignInUseCase>().call(
        params: SignInReqParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      ),
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Don't have an account?"),
          TextSpan(
            text: ' Sign Up',
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(
                  context,
                  SignUpPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
