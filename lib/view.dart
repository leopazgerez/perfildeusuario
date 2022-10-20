import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/ui/pagecomponent/user_profile.dart';

class View extends StatelessWidget {
  final String id = "view";
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text("Vista"),
      ),
      body: _body(),
    );
  }
  Widget _body(){
    return Column(
      children: const [
        UserProfile(),
      ],
    );
  }
}