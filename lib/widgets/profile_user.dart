import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            _AvatarWidget(),
            SizedBox(height: 20),
            _UserNameWidget(),
            SizedBox(height: 10),
            _UserPhoneNumber(),
            SizedBox(height: 8),
            _UserAccount(),
          ],
        ),
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
      'UserName',
      style: TextSgityle(
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
      child: const Placeholder(),
    );
  }
}
