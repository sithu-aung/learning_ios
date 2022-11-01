import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/src/auth/presentation/login.dart';
import 'package:learning/src/components/profile_edit.dart';
import 'package:learning/src/learning_page/components/background_page.dart';
import 'package:learning/src/learning_page/components/section_intro_hearder.dart';
import 'package:learning/src/main_map/repository/map_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  String? username;
  String? role;
  String? id;
  String? dob;
  String? phone;
  String? email;
  String? state;
  @override
  void initState() {
    _getUserName();
    super.initState();
  }

  void _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('name');
    role = prefs.getString('user_type');
    id = prefs.getString('s_id');
    dob = prefs.getString('dob');
    phone = prefs.getString('phone');
    email = prefs.getString('email');
    state = prefs.getString('state');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor:
            mqData.textScaleFactor > 1.0 ? 1.0 : mqData.textScaleFactor);

    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 255, 147),
        body: Stack(
          children: [
            BackgroundPage(
              backImage: "assets/images/app_back.jpg",
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SectionIntroHearderWithoutMenu(
                    onTap: () {},
                    title: "ကိုယ်ရေးအချက်အလက်များ",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Positioned(
              top: size.height * .16,
              child: Image.asset(
                'assets/images/wooden_six.png',
                height: size.height * .81,
                width: size.width * .6,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: size.height * .13,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: size.width * .55,
                  height: size.height * .56,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/papermedium.png'),
                    ),
                  ),
                  padding: const EdgeInsets.all(12).copyWith(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/frame2.png',
                                width: 35,
                                height: 35,
                              ),
                              Image.asset(
                                'assets/images/avator_boy2.png',
                                width: 35,
                                height: 35,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${role ?? '...'} ${username ?? '...'}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfileEdit()),
                              );
                            },
                            child: Image.asset(
                              'assets/images/editprofile.png',
                              width: 35,
                              height: 35,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'အသုံးပြုသူအိုင်ဒီ',
                            style: TextStyle(height: 1.5),
                          )),
                          Expanded(
                              child: Text(
                            id ?? '...',
                            style: const TextStyle(height: 1.5),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'မွေးသက္ကရာဇ်',
                            style: TextStyle(height: 1.5),
                          )),
                          Expanded(
                              child: Text(
                            dob ?? '...',
                            style: const TextStyle(height: 1.5),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'ဖုန်းနံပါတ်',
                            style: TextStyle(height: 1.5),
                          )),
                          Expanded(
                              child: Text(
                            phone ?? '...',
                            style: const TextStyle(height: 1.5),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'အီးမေးလ်',
                            style: TextStyle(height: 1.5),
                          )),
                          Expanded(
                              child: Text(
                            email ?? '...',
                            style: const TextStyle(height: 1.5),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'နေထိုင်ရာဒေသ',
                            style: TextStyle(height: 1.5),
                          )),
                          Expanded(
                              child: Text(
                            state ?? '...',
                            style: const TextStyle(height: 1.5),
                          )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 30, bottom: 0),
                          child: InkWell(
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              for (final i in prefs.getKeys()) {
                                if (i != "module1" &&
                                    i != "module2" &&
                                    i != "module3" &&
                                    i != "module4" &&
                                    i != "module5") {
                                  prefs.remove(i);
                                }
                              }
                              if (mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 3),
                              decoration: BoxDecoration(
                                // color: color_button,
                                gradient: const LinearGradient(
                                    colors: [Colors.red, Colors.redAccent]),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Text(
                                'ထွက်မယ်။',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .73,
              child: Container(
                width: size.width * .55,
                height: size.height * .23,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/papermedium.png'),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      'ရရှိထားသောဆုများ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ic_trophy.png",
                          width: 32,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset(
                          "assets/images/ic_trophy.png",
                          width: 32,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset(
                          "assets/images/ic_trophy.png",
                          width: 32,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: size.height * .16,
              child: Image.asset(
                'assets/images/wooden_six.png',
                height: size.height * .8,
                width: size.width * .415,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: size.height * .18,
              right: 0,
              child: Container(
                width: size.width * .37,
                height: size.height * .82,
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/papermedium.png'),
                  ),
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      role == 'farmer' ? 'သင်တန်းနည်းပြများ' : 'လယ်သမားများ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Consumer(builder: (context, ref, child) {
                      return Expanded(
                        child: ref.watch(getUserListProvider).when(
                              data: (data) => GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 35,
                                ),
                                itemCount: data.data!.data!.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             FarmerMapScreen(fromModule: false)));
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                      ),
                                      Text(data.data!.data![index].userName ??
                                          '...')
                                    ],
                                  ),
                                ),
                              ),
                              error: (e, st) => Text(
                                '$e',
                                style: const TextStyle(color: Colors.red),
                              ),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                      );
                    })
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * .17,
              right: size.width * .38,
              child: Image.asset(
                'assets/images/wooden_rings_four.png',
                width: size.width * .09,
                height: size.height * .45,
              ),
            ),
            Positioned(
              top: size.height * .76,
              right: size.width * .38,
              child: Image.asset(
                'assets/images/wooden_rings_four.png',
                width: size.width * .09,
                height: size.height * .45,
              ),
            )
          ],
        ),
      ),
    );
  }
}
