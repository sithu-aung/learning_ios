import 'package:flutter/material.dart';

class LessonProgress extends StatelessWidget {
  const LessonProgress({
    super.key,
    required this.lessonCounts,
  });
  final List<int>
      lessonCounts; // [1,2,1] 3 chapter =  1 lesson at chp 1  / 2 at 2 / 1 at 3
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
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                      width: 42,
                      height: 42,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/titlenoleaf.png'),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 35),
                      child: const Text(
                        '   တိုးတက်မှုအခြေအနေ     ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'သင်ခန်းစာ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 40,
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemBuilder: (context, index) => Row(
                              children: [
                                SizedBox(
                                  height: 40,
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
                                  width: 15,
                                  height: 3,
                                  color: Colors.black,
                                ),
                                Container(
                                  width: 3,
                                  height: 45,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            itemCount: lessonCounts.length,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: ListView.builder(
                                  reverse: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: 30,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        width: 35,
                                        height: 35,
                                        color: Colors.brown,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                      ),
                                      itemCount: lessonCounts[index],
                                    ),
                                  ),
                                  itemCount: lessonCounts.length,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 3,
                                            color: Colors.black,
                                          ),
                                          Container(
                                            width: 3,
                                            height: 10,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 45,
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
                                      itemCount: 9,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'အခန်း',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              color: Colors.cyan,
                              size: 50,
                            ),
                            const SizedBox(height: 10),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.brown.withOpacity(.8),
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   padding: const EdgeInsets.all(10),
                            //   child: const Text(
                            //     '',
                            //     style: TextStyle(color: Colors.white),
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            Container(
                              width: 40,
                              height: 40,
                              color: Colors.brown,
                            ),
                            const Text(
                              'မလေ့လာရသေး',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 40,
                              height: 40,
                              color: Colors.greenAccent.shade700,
                            ),
                            const Text(
                              'လေ့လာပြီးပြီ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 40,
                              height: 40,
                              color: Colors.red,
                            ),
                            const Text(
                              'လေ့လာနေဆဲ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
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