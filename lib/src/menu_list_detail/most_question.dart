import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/menu_list_detail/menu_list_text_widget.dart';
import 'package:learning/src/menu_list_detail/repository/help_most_questions.dart';

class MostQuestion extends ConsumerStatefulWidget {
  const MostQuestion({super.key});

  @override
  ConsumerState<MostQuestion> createState() => _MostQuestionState();
}

class _MostQuestionState extends ConsumerState<MostQuestion>
    with SingleTickerProviderStateMixin {
  int? isSelected;

  late final animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));

  late final curveAnimation =
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

  @override
  void dispose() {
    curveAnimation.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuListTextWidget(
      title: 'Help',
      text: 'text',
      widgetStatus: true,
      widget: ref.watch(mostQuestionControllerProvider).when(
            error: (e, st) => Center(
              child: Text(
                e.toString(),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (data) => AnimatedBuilder(
                animation: curveAnimation,
                builder: (context, child) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              isDense: true,
                              suffixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.data?.data?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = data.data?.data?[index];
                              return InkWell(
                                onTap: () {
                                  if (animationController.isCompleted) {
                                    animationController.reverse();
                                  } else {
                                    animationController.forward();
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  color: Colors.amber.withOpacity(0.5),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item?.question ?? '...',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            wordSpacing: 1.3),
                                      ),
                                      const SizedBox(height: 10),
                                      SizeTransition(
                                        sizeFactor: curveAnimation,
                                        child: Text(item?.answer ?? '...'),
                                      ),
                                      // Visibility(
                                      //   visible: isSelected == index,
                                      //   child: Text(
                                      //     item?.answer ?? '...',
                                      //     style: const TextStyle(
                                      //         fontSize: 16,
                                      //         color: Colors.black,
                                      //         wordSpacing: 1.3),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  );
                }),
          ),
    );
  }
}
