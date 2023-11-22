import 'package:flutter/material.dart';

class DrawerField extends StatelessWidget {
  void Function()? onTap;
  final String title;
  final Icon leading;
  DrawerField({
    super.key,
  required this.onTap,
  required this.title,
    required this.leading
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(9)
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
            fontSize: 16),
          ),
        ),
      )
    );
  }
}