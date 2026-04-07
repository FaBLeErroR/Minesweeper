import 'package:flutter/material.dart';

final class UiButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double? width;
  final double? height;

  const UiButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.width,
    this.height,
  });

  @override
  State<UiButton> createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50,
      width: widget.width ?? double.infinity,
      child: ElevatedButton(onPressed: widget.onPressed, child: Text(widget.text)),
    );
  }
}
