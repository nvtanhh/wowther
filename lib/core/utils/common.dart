import 'package:flutter/material.dart';

import '../../presentation/common_widgets/common_widget.index.dart';

class CommonUtils {
  static void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: AppSpacer.edgeInsetsAll12,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.8),
              borderRadius: AppSpacer.radius24,
            ),
            child: ThemedText(
              content,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
