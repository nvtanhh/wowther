import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resources/common/extensions/extensions.index.dart';
import 'package:flutter_resources/presentation/shared_blocs/shared_bloc_index.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Center(
        child: Text('Sign in Page'),
      ).clickable(() {
        context.read<ThemeCubit>().toggleTheme();
      }),
    );
  }
}
