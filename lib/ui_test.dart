import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';

class SampleAnimation extends StatefulWidget {
  const SampleAnimation();

  @override
  State<StatefulWidget> createState() {
    return SampleAnimationState();
  }
}

class SampleAnimationState extends State<SampleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;
  Path? _path;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
    _animation = Tween(begin: 0.0, end: 0.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();
    _path = drawPath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: calculate(_animation!.value).dy,
            left: calculate(_animation!.value).dx,
            child: calculate(_animation!.value).dy < 197.58206176757812
                ? Image.asset(
                    "assets/images/mb1.png",
                    width: MediaQuery.of(context).size.width * 0.1,
                  )
                : Image.asset(
                    "assets/images/mb2.png",
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Path drawPath() {
    Size size = const Size(300, 300);
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    return path;
  }

  Offset calculate(value) {
    PathMetrics pathMetrics = _path!.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    log(pos!.position.dy.toString());
    return pos.position;
  }
}

class PathPainter extends CustomPainter {
  Path path;

  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RoatationTest extends StatefulWidget {
  const RoatationTest({Key? key}) : super(key: key);
  @override
  State<RoatationTest> createState() => _RoatationTestState();
}

// Don't forget "with TickerProviderStateMixin"
class _RoatationTestState extends State<RoatationTest>
    with TickerProviderStateMixin {
  // Create a controller
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  // Create an animation with value of type "double"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Wrap(
              children: [
                Image.asset(
                  "assets/images/mb1.png",
                  width: MediaQuery.of(context).size.width * 0.1,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 54),
                  child: Image.asset(
                    "assets/images/mb2.png",
                    width: MediaQuery.of(context).size.width * 0.12,
                    fit: BoxFit.fill,
                  ),
                ),
                Image.asset(
                  "assets/images/mb3.png",
                  width: MediaQuery.of(context).size.width * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
      // This button is used to pause/resume the animation
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.moving),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop(); // Stop the animation
          } else {
            _controller.repeat(); // Start the animation
          }
        },
      ),
    );
  }

// dispose the animation controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
