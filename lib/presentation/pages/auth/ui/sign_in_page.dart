import 'package:flutter/material.dart';

import '../../../../common/theme/theme.index.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Center(
        child: Text('Sign in Page'),
      ),
    );
  }
}
