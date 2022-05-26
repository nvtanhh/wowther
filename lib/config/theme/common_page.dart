import 'package:flutter/material.dart';

import 'spacer.dart';

class CommonPage extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomAppBar;
  final WillPopCallback? onWillPop;
  final EdgeInsets padding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final String? backgroundImage;

  const CommonPage({
    Key? key,
    required this.body,
    this.appBar,
    this.bottomAppBar,
    this.onWillPop,
    this.padding = AppSpacer.edgeInsetsHorizontal16,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop != null ? onWillPop! : () async => true,
      child: Scaffold(
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        appBar: appBar,
        body: SafeArea(
          child: Container(
            decoration: backgroundImage == null
                ? null
                : BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(backgroundImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
            padding: padding,
            child: body,
          ),
        ),
        bottomNavigationBar: bottomAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
