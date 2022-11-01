import 'package:flutter/material.dart';
import 'dart:math' as math;

class IntroListWidget extends StatefulWidget {
  const IntroListWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.lessons,
  });
  final String? title;
  final Function(int)? onTap;
  final List<String> lessons;

  @override
  State<IntroListWidget> createState() => _IntroListWidgetState();
}

class _IntroListWidgetState extends State<IntroListWidget>
    with TickerProviderStateMixin {
  bool expand = false;
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 10, bottom: 8),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xff797eb8)),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (_controller.isCompleted) {
                            _controller.reverse();
                          } else {
                            _controller.forward();
                          }
                        },
                        child: SizedBox(
                          height: widget.title!.length > 50 ? 64 : 48,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      widget.title ?? '...',
                                      style: const TextStyle(
                                          height: 1.5,
                                          color: Colors.black,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                Transform.rotate(
                                  angle:
                                      -math.pi / 180 * (_controller.value * 90),
                                  child: const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    size: 28,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizeTransition(
                  sizeFactor: _controller,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Material(
                      color: const Color(0xff797eb8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: Colors.black,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => widget.onTap?.call(index),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(widget.lessons[index])),
                                    ],
                                  ),
                                  index != widget.lessons.length - 1
                                      ? const Divider(
                                          color: Colors.black,
                                        )
                                      : const SizedBox(
                                          height: 4,
                                        ),
                                ],
                              ),
                            ),
                            shrinkWrap: true,
                            itemCount: widget.lessons.length,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
