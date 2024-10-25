import 'package:flutter/cupertino.dart';

class CustomHeader extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoNavigationBar(
      middle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'GOaTRIP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              CupertinoIcons.bell,
              size: 24,
              color: CupertinoColors.black,
            ),
          ),
        ],
      ),
      backgroundColor: CupertinoColors.transparent,
      border: Border(bottom: BorderSide.none),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  // Implement the shouldFullyObstruct method
  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true; // Adjust this based on your requirements
  }
}