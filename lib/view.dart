import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/models/person_model.dart';
import 'package:perfildeusuario/src/ui/pagecomponent/user_profile.dart';

class View extends StatelessWidget {
  final String id = "view";
  View({Key? key}) : super(key: key);
  
  final PersonModel personaNN = PersonModel('Benito', 'Camela', 'bcamela@gmail.com', 8008135, 'Localidad', 2874125478);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: _body(),
      ),
    );
  }
  Widget _body(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button(Icons.arrow_back, false),
                _button(Icons.notifications_outlined, true),
              ],
            ),
            UserProfile(model: personaNN),
          ],
        ),
      ),
    );
  }
  _button(iconData, showBadge){
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      color: Colors.white,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Badge(
            showBadge: showBadge,
            badgeContent: Container(),
            badgeColor: Colors.red,
            position: const BadgePosition(top: 12, end: 10),
            child: Icon(
              iconData,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
