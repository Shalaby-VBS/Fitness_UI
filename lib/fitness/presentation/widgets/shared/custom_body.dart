import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';

class CustomBody extends StatelessWidget {
  final AnimationController? animationController;
  final ScrollController scrollController;
  final List<Widget> listViews;
  const CustomBody({
    super.key,
    this.animationController,
    required this.scrollController,
    required this.listViews,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AppUtils.getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
