import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _useRtlText = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marquee',
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ListView(
          padding: EdgeInsets.only(top: 50),
          children: [
            _buildComplexMarquee(),
          ].map(_wrapWithStuff).toList(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => setState(() => _useRtlText = !_useRtlText),
          label: !_useRtlText
              ? const Text('Switch to Hebrew')
              : const Text('החלף לאנגלית'),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildComplexMarquee() {
    return Marquee(
      key: Key("$_useRtlText"),
      text: !_useRtlText
          ? 'Some sample text that takes some space.'
          : 'זהו משפט ראשון של הטקסט הארוך. זהו המשפט השני של הטקסט הארוך',
      style: TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20,
      velocity: 40,
      pauseAfterRound: Duration(seconds: 3),
      showFadingOnlyWhenScrolling: false,
      fadingEdgeStartFraction: 0.0,
      fadingEdgeEndFraction: 0.0,
      startPadding: 0,
      accelerationDuration: Duration(seconds: 3),
      accelerationCurve: Curves.easeIn,
      decelerationDuration: Duration(seconds: 3),
      decelerationCurve: Curves.easeOut,
      textDirection: _useRtlText ? TextDirection.rtl : TextDirection.ltr,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(height: 50, color: Colors.white, child: child),
    );
  }
}
