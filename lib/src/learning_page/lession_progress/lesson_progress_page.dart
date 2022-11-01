import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/util/utils.dart';

class LessonProgress extends StatefulWidget {
  List<List<List<double>>> scores;
  LessonProgress({super.key, required this.scores});
  @override
  State<LessonProgress> createState() => _LessonProgressState();
}

class _LessonProgressState extends State<LessonProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/agre_back.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: SectionIntroHearderWithoutMenuProgress(
                  title:
                      'စိုက်ပျိုးဂေဟစနစ်ဆိုင်ရာ အလေ့အထများရဲ့ \nတိုးတက်မှုအခြေအနေပြဇယား',
                  onTap: () => Navigator.pop(context),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .75,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20),
                  children: [
                    const Text(
                      'သင်ခန်းစာ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 32,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            reverse: true,
                            itemBuilder: (context, index) => Row(
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  width: 5,
                                  height: 3,
                                  color: Colors.black,
                                ),
                                Container(
                                  width: 3,
                                  height: 32,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            itemCount: 7,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.only(left: 8),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              scrollDirection: Axis.vertical,
                              itemCount: widget.scores.length,
                              itemBuilder: (context, index) {
                                log(widget.scores[index].toString());

                                return SizedBox(
                                  height: 32,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: widget.scores[index].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index2) {
                                      double total = 0;
                                      log(widget.scores[index][index2]
                                          .toString());

                                      for (int i = 0;
                                          i <
                                              widget
                                                  .scores[index][index2].length;
                                          i++) {
                                        total +=
                                            widget.scores[index][index2][i];
                                      }
                                      if (total != 0.0) {
                                        total = total /
                                            widget.scores[index][index2].length;
                                      }
                                      log("total  $total");
                                      return Container(
                                        width: 32,
                                        height: 32,
                                        color: total == 0.0
                                            ? const Color.fromARGB(
                                                215, 66, 31, 6)
                                            : total < 1
                                                ? const Color.fromARGB(
                                                    215, 212, 49, 47)
                                                : const Color.fromARGB(
                                                    215, 176, 204, 33),
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: Center(
                                          child: Text(
                                            "${Util.intToMM(index + 1)}. ${Util.intToMM(index2 + 1)}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // const Icon(
                              //   Icons.emoji_events,
                              //   color: Colors.cyan,
                              //   size: 42,
                              // ),
                              const SizedBox(height: 10),
                              Container(
                                width: 32,
                                height: 32,
                                color: const Color.fromARGB(215, 66, 31, 6),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'မလေ့လာရသေး။',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 32,
                                height: 32,
                                color: const Color.fromARGB(215, 176, 204, 33),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'လေ့လာပြီးပြီ။',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                  width: 32,
                                  height: 32,
                                  color:
                                      const Color.fromARGB(215, 212, 49, 47)),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'လေ့လာနေဆဲ။',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 42,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 42,
                                    height: 3,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    width: 3,
                                    height: 10,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 42,
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              itemCount: 8,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'အခန်း',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
