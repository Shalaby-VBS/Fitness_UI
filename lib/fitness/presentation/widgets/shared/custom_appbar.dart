import 'package:flutter/material.dart';

import '../../../../core/theme/fitness_app_theme.dart';

class CustomAppbar extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? topBarAnimation;
  double topBarOpacity;
  final String title;
  final String date;
  CustomAppbar({super.key, this.animationController, this.topBarAnimation, this.topBarOpacity = 0.0, required this.title, required this.date,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  30 * (1.0 - topBarAnimation!.value),
                  0.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: FitnessAppTheme.grey
                            .withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Screen Top Bar
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      // AppBar
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12 - 8.0 * topBarOpacity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // My Diary
                            _buildMyDiaryText(title),
                            // Left Arrow
                            _buildAppBarIcon(Icons.keyboard_arrow_left, () {}),
                            // Calendar
                            _buildAppBarCalendar(date),
                            // Right Arrow
                            _buildAppBarIcon(Icons.keyboard_arrow_right, () {}),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }


  _buildMyDiaryText(title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: FitnessAppTheme.fontName,
            fontWeight: FontWeight.w700,
            fontSize: 22 + 6 - 6 * topBarOpacity,
            letterSpacing: 1.2,
            color: FitnessAppTheme.darkerText,
          ),
        ),
      ),
    );
  }

  _buildAppBarIcon(IconData icon, Function()? onTap) {
    return SizedBox(
      height: 38,
      width: 38,
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        onTap: onTap,
        child: Center(
          child: Icon(
            icon,
            color: FitnessAppTheme.grey,
          ),
        ),
      ),
    );
  }

  _buildAppBarCalendar(date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.calendar_today,
              color: FitnessAppTheme.grey,
              size: 18,
            ),
          ),
          Text(
            date,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: FitnessAppTheme.fontName,
              fontWeight: FontWeight.normal,
              fontSize: 18,
              letterSpacing: -0.2,
              color: FitnessAppTheme.darkerText,
            ),
          ),
        ],
      ),
    );
  }
}