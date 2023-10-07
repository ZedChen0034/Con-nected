import 'package:flutter/material.dart';

class KeyboardAwareSlidingPanel extends StatefulWidget {
  final Widget child;

  KeyboardAwareSlidingPanel({required this.child});

  @override
  _KeyboardAwareSlidingPanelState createState() => _KeyboardAwareSlidingPanelState();
}

class _KeyboardAwareSlidingPanelState extends State<KeyboardAwareSlidingPanel> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: widget.child,
    );
  }
}
