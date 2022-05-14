import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injector/injection.dart';
import '../../../../common_widgets/common_widget.index.dart';
import '../../../../shared_blocs/theme_cubit/theme_cubit.dart';

class FontSettingPage extends StatelessWidget {
  const FontSettingPage({Key? key}) : super(key: key);

  void _onChange(String font) {
    locator<ThemeCubit>().onChangeTheme(font: font);
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: Text('Font Setting'),
                pinned: true,
              ),
              SliverSafeArea(
                top: false,
                sliver: SliverPadding(
                  padding: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        Widget? trailing;
                        final item = state.supportedFonts![index];
                        if (item == state.font) {
                          trailing = Icon(
                            Icons.check,
                            color: Theme.of(context).primaryColor,
                          );
                        }
                        return AppListTitle(
                          title: item,
                          trailing: trailing,
                          border: item != state.supportedFonts!.last,
                          onPressed: () => _onChange(item),
                        );
                      },
                      childCount: state.supportedFonts?.length ?? 0,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
