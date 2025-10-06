import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      width: mq.width,
      height: mq.height * 0.07,
      margin: EdgeInsets.symmetric(
        horizontal: mq.width * 0.04,
        vertical: mq.height * 0.01,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.06,
            vertical: mq.height * 0.02,
          ),
          elevation: 3,
          shadowColor: Colors.yellow.withValues(alpha: 0.3),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: mq.width * 0.045,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
