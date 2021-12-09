import 'dart:ui';
import 'package:blur_bottom_bar/blur_bottom_bar.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.bookmark, 'Favorite'),
    MenuRowData(Icons.notification_add, 'Notifications'),
    MenuRowData(Icons.lock, 'Privacy'),
    MenuRowData(Icons.data_saver_off, 'Data and Storage'),
  ];

  final List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.computer, 'Active Session'),
    MenuRowData(Icons.person, 'Appearance'),
    MenuRowData(Icons.language, 'Language'),
    MenuRowData(Icons.emoji_emotions, 'Stikers'),
    MenuRowData(Icons.folder_open, 'Chat Folders'),
  ];

  final List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.watch, 'Watch'),
  ];

  final List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help_center, 'Help Center'),
    MenuRowData(Icons.question_answer, 'Questions'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.indigo,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.indigo
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          title: const Text('Settings'),
        ),
        bottomNavigationBar: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: 2,
              selectedItemColor: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 10),
            const _UserInfo(),
            const SizedBox(height: 10),
            _MenuWidget(menuRow: firstMenuRow),
            const SizedBox(height: 10),
            _MenuWidget(menuRow: secondMenuRow),
            const SizedBox(height: 10),
            _MenuWidget(menuRow: thirdMenuRow),
            const SizedBox(height: 10),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

void printLogButton() {
  print('Edit');
}

void printLogout() {
  print('Logout');
}

//MenuBox
class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(127, 255, 0, 127),
        child: Column(
          children: menuRow.map((data) => _MenuRowWidget(data: data)).toList(),
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

//MenuRow
class _MenuRowWidget extends StatelessWidget {
  final MenuRowData data;

  const _MenuRowWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(data.text),
            ),
            body: const SizedBox.shrink(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(data.icon),
                const SizedBox(width: 10),
                Expanded(child: Text(data.text)),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//UserInfoBox
class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const _AvatarWidget(),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  const _UserNameWidget(),
                  const SizedBox(height: 5),
                  const _UserPhoneNumber(),
                  const SizedBox(height: 3),
                  const _UserAccount(),
                  Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.grey),
                            overlayColor: MaterialStateProperty.all(
                                const Color.fromARGB(100, 192, 192, 192)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:
                                        const BorderSide(color: Colors.grey)))),
                        onPressed: printLogButton,
                        child: const Text(
                          'Edit',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                const Color.fromARGB(100, 255, 0, 0)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                        onPressed: printLogout,
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//UserNickname
class _UserAccount extends StatelessWidget {
  const _UserAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('@bulkin007');
  }
}

//UserPhonenumber
class _UserPhoneNumber extends StatelessWidget {
  const _UserPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('+375 (29) 123-45-67');
  }
}

//UserName
class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Vasia Bulkin',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

//UserAvatar
class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: NetworkImage(
          'https://i.pinimg.com/280x280_RS/ce/29/0c/ce290c79566ab013f74965312c0fe01b.jpg'),
    );

    // ClipRRect(
    //   borderRadius: BorderRadius.circular(23.0),
    //   child: Image.network(
    //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYs4UR3jV93dfhX7ZzV0cxbNkyeu-pvgZG8A&usqp=CAU',
    //       width: 120,
    //       height: 120,
    //       fit: BoxFit.fill),
    // );
  }
}

//InkWell
//FormWidget
