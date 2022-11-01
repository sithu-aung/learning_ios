import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/presentation/common/pwd_change_email_reusable_scaffold.dart';
import 'package:learning/src/main_map/controller/friend_respond_controller.dart';
import 'package:learning/src/notification/repository/noti_repo.dart';
import 'package:learning/tool_widgets.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PwdChangeEmailScaffold(
      isQuestion: true,
      isNoti: true,
      topPadding: 30,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 700,
            child: ref.watch(getNotiListProvider).when(
                  data: (data) {
                    final item = data.noti!.data;
                    if (item!.isEmpty) {
                      return const Center(
                        child: Text('Data is Empty'),
                      );
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) => Container(
                        decoration: shadowDecorationWithBorderColor(
                            const Color(0xffc8a25b),
                            const Color(0xffc8a25b),
                            12),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item[index].message ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            if (item[index].isRespondable ?? false)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BouncingWidget(
                                    duration: const Duration(milliseconds: 400),
                                    scaleFactor: 1,
                                    onPressed: () async {
                                      await ref
                                          .read(friendRespondControllerProvider
                                              .notifier)
                                          .respond(
                                            socialId: item[index].socialId!,
                                            accept: true,
                                          );
                                    },
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/button_green_round.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 16,
                                            left: 42,
                                          ),
                                          child: Text(
                                            "လက်ခံ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  BouncingWidget(
                                    duration: const Duration(milliseconds: 400),
                                    scaleFactor: 1,
                                    onPressed: () async {
                                      await ref
                                          .read(friendRespondControllerProvider
                                              .notifier)
                                          .respond(
                                            socialId: item[index].socialId!,
                                            accept: false,
                                          );
                                    },
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/button_orange.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 16,
                                            left: 42,
                                          ),
                                          child: Text(
                                            "ငြင်းပယ်",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              height: 1.2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            const SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      itemCount: data.noti!.data!.length,
                    );
                  },
                  error: (e, st) => Text(
                    '$e $st',
                    style: const TextStyle(color: Colors.red),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
          )
        ],
      ),
    );
  }
}
