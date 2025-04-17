import 'package:flutter/material.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  const HomeMeetingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed);
  }
}
