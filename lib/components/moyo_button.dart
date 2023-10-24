import 'package:flutter/material.dart';

class MoyoButton extends StatelessWidget {
  void Function()? onTap;
  final String text;
  MoyoButton({
    super.key,
  required this.onTap,
  required this.text,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(9)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            fontSize: 16),
          ),
        ),
      )
    );
  }
}