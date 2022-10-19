import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _top(),
          _bottom(),
        ],
      ),
    );
  }
  Widget _top(){
    return Container();
  }
  Widget _bottom(){
    return Container();
  }
}
