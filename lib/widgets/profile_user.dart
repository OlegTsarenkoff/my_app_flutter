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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _UserInfo(),
            SizedBox(height: 10),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 10),
            _MenuWidget(menuRow: secondMenuRow),
          ],
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

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: menuRow.map((data) => _MenuRowWidget(data: data)).toList(),
      ),
    );
  }
}

class _MenuRowWidget extends StatelessWidget {
  final MenuRowData data;

  const _MenuRowWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onLongPress: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('fqewfqwef'),
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
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

//UserInfo

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: const [
          SizedBox(height: 20),
          _AvatarWidget(),
          SizedBox(height: 10),
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

class _UserAccount extends StatelessWidget {
  const _UserAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('@user_account');
  }
}

class _UserPhoneNumber extends StatelessWidget {
  const _UserPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('user_phonenumber');
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Митя Булкин',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Image.network(
          'https://pbs.twimg.com/profile_images/2949489744/f02783142860b50d905a2e47ca099efc_400x400.jpeg'),
    );
  }
}



//InkWell
//FormWidget