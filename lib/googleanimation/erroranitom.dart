import 'dart:async';
import 'package:flutter/material.dart';

class ErrorAnimation extends StatefulWidget {
  final String errorMessage;
  final VoidCallback onDismiss;

  const ErrorAnimation({
    Key? key,
    required this.errorMessage,
    required this.onDismiss,
  }) : super(key: key);

  @override
  _ErrorAnimationState createState() => _ErrorAnimationState();
}

class _ErrorAnimationState extends State<ErrorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start off-screen
      end: Offset.zero, // Slide into view
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start animation
    _controller.forward();

    // Auto dismiss after 3 seconds
    Timer(const Duration(seconds: 3), () {
      _controller.reverse().then((_) {
        widget.onDismiss(); // Notify parent to remove the widget
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        color: Colors.red,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          widget.errorMessage,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
