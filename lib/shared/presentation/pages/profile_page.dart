import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.profile),
      ),
      body: Center(
        child: Text(S.current.profile),
      ),
    );
  }
}
