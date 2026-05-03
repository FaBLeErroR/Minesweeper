import 'package:flutter/material.dart';

final class UiButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isLoading;
  final double? width;
  final double? height;
  final ButtonStyle? style;

  const UiButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.width,
    this.height,
    this.style,
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
      child: ElevatedButton(style: widget.style, onPressed: widget.onPressed, child: widget.child),
    );
  }
}
