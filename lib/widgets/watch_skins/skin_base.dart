import 'package:flutter/material.dart';

class SkinBase extends StatelessWidget {
  final Widget? child;
  const SkinBase({Key? key, this.child}) : super(key: key);

  //TODO: ! use inheritance for skins
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('base skin not implemented'),
    );
  }
}
