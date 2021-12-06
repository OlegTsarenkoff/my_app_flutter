import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/profile_user.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfile(),
    );
  }
}
