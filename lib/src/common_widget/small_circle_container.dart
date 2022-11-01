import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/interactive/quizz_page1.dart';

class QuizCircleIndex extends ConsumerWidget {
  const QuizCircleIndex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: ref.watch(quizzIndexProvider) == index
                        ? Colors.white
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
