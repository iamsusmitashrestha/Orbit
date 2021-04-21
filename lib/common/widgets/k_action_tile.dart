import 'package:flutter/material.dart';

class KActionTile extends StatelessWidget {
  final IconData icon;
  final Widget child;
  final void Function() onPressed;

  KActionTile(
      {required this.icon, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onPressed,
        leading: Icon(icon),
        title: child,
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
