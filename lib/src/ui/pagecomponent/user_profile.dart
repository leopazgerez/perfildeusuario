import 'package:flutter/material.dart';

import '../../models/person_model.dart';

class UserProfile extends StatelessWidget {
   const UserProfile({Key? key, this.personModel}) : super(key: key);
  final PersonModel? personModel;
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
