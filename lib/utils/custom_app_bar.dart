import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color fontColor;
  final Color backgroundColor;
  final double fontSize;
  final bool viewDrawerIcon;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.fontColor,
    required this.fontSize,
    required this.viewDrawerIcon,
    required this.backgroundColor,
    required this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
        ),
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: viewDrawerIcon,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
