import 'package:flutter/material.dart';

class SkinItem extends StatelessWidget {
  final Widget child;
  const SkinItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: child,
    );
  }
}
