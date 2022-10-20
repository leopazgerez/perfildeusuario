import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/ui/pagecomponent/user_profile.dart';

class View extends StatelessWidget {
  final String id = "view";
  View({Key? key}) : super(key: key);
  final PersonModel personaNN = PersonModel('name', 'surname', 'example@gmail.com', 25789645, 'location', 2874125478);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vista"),
      ),
      body: _body(),
    );
  }
  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfile(model: personaNN,),
        ],
      ),
    );
  }
}