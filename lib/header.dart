import 'package:flutter/cupertino.dart';

class Header extends StatefulWidget {
  final String title;

  const Header({super.key, required this.title});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Widget headerContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.black,
          ),
        ),
        const Icon(
          CupertinoIcons.bell,
          size: 28,
          color: CupertinoColors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: headerContainer(context),
    );
  }
}
