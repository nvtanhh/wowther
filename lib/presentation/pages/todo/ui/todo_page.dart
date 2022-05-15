import 'package:flutter/material.dart';

import '../../../../common/theme/theme.index.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      body: Center(
        child: Text('Todo Page'),
      ),
    );
  }
}
