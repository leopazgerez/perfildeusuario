import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/models/person_model.dart';
import 'package:perfildeusuario/src/ui/pagecomponent/user_profile.dart';

class View extends StatelessWidget {
  final String id = "view";
  View({Key? key}) : super(key: key);
  
  final PersonModel personaNN = PersonModel('Benito', 'Camela', 'bcamela@gmail.com', 25789645, 'Localidad', 2874125478);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: _body(),
    );
  }
  Widget _body(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserProfile(model: personaNN),
          ],
        ),
      ),
    );
  }
}