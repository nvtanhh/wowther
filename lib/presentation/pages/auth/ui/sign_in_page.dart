import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resources/common/extensions/extensions.index.dart';
import 'package:flutter_resources/presentation/pages/auth/auth_index.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Sign in Page'),
      ).clickable(() {
        context.read<SignInCubit>().testObserver();
      }),
    );
  }
}
