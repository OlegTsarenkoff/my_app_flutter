import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
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
  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.cyanAccent, Colors.purpleAccent, Colors.pink],
        )),
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const _UserInfo(),
                const SizedBox(height: 10),
                _MenuWidget(menuRow: firstMenuRow),
                const SizedBox(height: 10),
                _MenuWidget(menuRow: secondMenuRow),
              ],
            ),
          ),
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
      margin: EdgeInsets.symmetric(horizontal: 8),
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
              title: Text('$data'),
            ),
            body: const SizedBox.shrink(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(data.icon),
            SizedBox(width: 10),
            Expanded(child: Text(data.text)),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
            )
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
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: const [
          SizedBox(height: 16),
          _AvatarWidget(),
          SizedBox(height: 8),
          _UserNameWidget(),
          SizedBox(height: 3),
          _UserPhoneNumber(),
          SizedBox(height: 3),
          _UserAccount(),
          SizedBox(height: 8),
        ],
      ),
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
      'Mitya Bulkin',
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYs4UR3jV93dfhX7ZzV0cxbNkyeu-pvgZG8A&usqp=CAU',
          width: 100,
          height: 100,
          fit: BoxFit.fill),
    );
  }
}




//InkWell
//FormWidget