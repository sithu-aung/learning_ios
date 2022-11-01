import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning/src/util/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserProgress extends StatefulWidget {
  List<List<List<double>>> scores;
  int moduleNumber;
  UserProgress({super.key, required this.scores, required this.moduleNumber});

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  @override
  void initState() {
    super.initState();
    log(widget.scores.toString());
    log("Module Number ${widget.moduleNumber}");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 40, top: 20),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.moduleNumber == 0
              ? 0
              : widget.scores[widget.moduleNumber - 1].length,
          itemBuilder: (context, index) {
            log("Length: ${widget.scores[widget.moduleNumber - 1][index]}");
            return Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    'အခန်း ${Util.intToMM(widget.moduleNumber)}. ${Util.intToMM(index + 1)}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  height: 37,
                  // width: MediaQuery.of(context).size.width - 100,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount:
                        widget.scores[widget.moduleNumber - 1][index].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index2) {
                      double total = 0;

                      return LinearPercentIndicator(
                        width: 120,
                        animation: true,
                        lineHeight: 34,
                        animationDuration: 1000,
                        percent: widget.scores[widget.moduleNumber - 1][index]
                            [index2],
                        center: Text(
                          "${Util.intToMM(widget.moduleNumber)}.${Util.intToMM(index + 1)}.${Util.intToMM(index2 + 1)}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: widget.scores[widget.moduleNumber - 1]
                                          [index][index2] >
                                      0.4
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12),
                        ),
                        barRadius: const Radius.circular(4),
                        progressColor: const Color.fromARGB(255, 22, 100, 51),
                        backgroundColor:
                            const Color.fromARGB(255, 222, 218, 184),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
