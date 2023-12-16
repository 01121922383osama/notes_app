import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String titel;
  final IconData icon;
  final void Function()? onPressed;
  const CustomAppBarWidget(
      {super.key, required this.titel, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titel,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
          ),
        ),
      ],
    );
  }
}
