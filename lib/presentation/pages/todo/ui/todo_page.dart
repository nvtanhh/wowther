import 'package:flutter/material.dart';

import '../../../../config/theme/common_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonPage(
      body: Center(
        child: Text('Todo Page'),
      ),
    );
  }
}
