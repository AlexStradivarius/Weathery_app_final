import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final List<Widget> actions;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.appBar,
    required this.actions,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 30,
          ),
          SizedBox(width: 10),
          Text(title),
        ],
      ),
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
