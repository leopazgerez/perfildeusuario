import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/models/person_model.dart';
import 'package:perfildeusuario/src/ui/pagecomponent/custom_button.dart';

class UserProfile extends StatefulWidget {
  final PersonModel? model;
  const UserProfile({Key? key, this.model}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final numberPhone = "3877777";
  final currentPassword = "pass";
  final nameAndSurname = 'Ana Paz';
  final email = 'example@gmail.com';
  final double paddingVertical = 8;
  final double paddingHorizontal = 16;
  final double borderRadiusTextForm = 12;
  final double sizeTextForm = 14;
  List<String> locationList = [
    'Salta',
    'Joaquin V. Gonzalez',
    'Quebrachal',
    'Metan'
  ];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTapIcon = true;
  bool iconEyeNewPassword = false;
  bool iconEyeConfirmPassword = false;

  isTapIconf() {
    isTapIcon = !isTapIcon;
  }

  isTapIconEyeNewPassword() {
    iconEyeNewPassword = !iconEyeNewPassword;
  }

  isTapIconEyeConfirmPassword() {
    iconEyeConfirmPassword = !iconEyeConfirmPassword;
  }

  String? emailValidator(email) {
    if (email == null || email.isEmpty) {
      return 'E-mail es requerido';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) return 'Formato Incorrecto de E-mail';
    return null;
  }

  String? dniValidator(dni) {
    if (dni == null || dni.isEmpty) {
      return 'DNI es requerido';
    } else if (dni.length > 9 && dni.length < 12) {
      return 'DNI es incorrecto';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    IconData icon =
        isTapIcon ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _customTitleTextForm(
                title: "Editar perfil",
                fontSize: 18,
              ),
            ),
            _customTitleTextForm(title: "Nombre y apellido"),
            _customTextFormField(
                hintText: "Nombre y apellido", initialValue: nameAndSurname),
            _titleTextForm("Email"),
            _customTextFormField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                initialValue: email,
                validator: emailValidator,
            ),
            /*
            _textFormField(email, "Email", TextInputType.emailAddress,
                validator: (email) {
              if (email == null || email.isEmpty) {
                return 'E-mail es requerido';
              }
              String pattern = r'\w+@\w+\.\w+';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(email)) return 'Formato Incorrecto de E-mail';
              return null;
            }),
            */
            _customTitleTextForm(title: "DNI"),
            _customTextFormField(hintText: "9.955.976.."),
            _titleTextForm("Localidad"),
            _textFormField(
                "", "Aquí va el dropwond **********", TextInputType.text),
            _titleTextForm("Celular"),
            _textFormField(numberPhone, "387678953..", TextInputType.number),
            _titleTextForm("Cambiar contraseña"),
            _customTextFormFieldIE("", "Nueva contraseña", TextInputType.text,
                () {
              setState(() {
                isTapIconEyeNewPassword();
              });
            }, iconInfo: true, iconEye: true, isTapIcon: iconEyeNewPassword),
            _customTextFormFieldIE(
                "", "Repetir contraseña nueva", TextInputType.text, () {
              setState(() {
                isTapIconEyeConfirmPassword();
              });
            }, iconEye: true, isTapIcon: iconEyeConfirmPassword),
            _customButton(
                "Guardar", const Color(0xFF0000CC), 36, 16, FontWeight.w500, 1),
          ],
        ),
      ),
    );
  }

  Widget _customButton(
      text, backgroundColor, height, textSize, textWeight, letterSpacing) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: CustomButton(
          width: 250,
          text: "Guardar",
          onTap: () {
            setState(() {
              if (formKey.currentState!.validate()) {
                print("OOOOOK");
              } else {
                print("Noooo OK");
              }
            });
          },
          backgroundColor: const Color(0xFF0000CC),
          height: 36,
          textSize: 16,
          textWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _customTitleTextForm({required String title, double? fontSize = 14}) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _titleTextForm(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _customTextFormFieldIE(
      String initialValue, String hintText, keyboardType, onTap,
      {bool? iconInfo, bool? iconEye, bool? isTapIcon}) {
    IconData icon = Icons.visibility_outlined;
    if (isTapIcon != null) {
      icon =
          isTapIcon ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    }
    //bool? obscureText
    bool obscureText = !isTapIcon!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadiusTextForm),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: sizeTextForm,
              ),
            ),
          ),
        ),
        Visibility(
          visible: iconInfo != null,
          child: GestureDetector(
            child: Icon(
              Icons.info_outline,
              size: 20,
              color: Colors.grey.shade600,
            ),
            onTap: () {
              const snackBar = SnackBar(
                content: Text('Ingrese su nueva contraseña'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Visibility(
          visible: iconEye != null,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              icon,
              size: 20,
              color: Colors.grey.shade600,
            ),
          ),
        )
      ]),
    );
  }
  Widget _customTextFormFieldDDD({
    required String hintText,
    TextInputType? keyboardType,
    String? initialValue,
    void Function()? onTapInfo,
    void Function()? onTapEye,
    bool? iconInfo, bool? iconEye, bool? isTapIcon}
    ) {
    IconData icon = Icons.visibility_outlined;
    if (isTapIcon != null) {
      icon =
          isTapIcon ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    }
    //bool? obscureText
    bool obscureText = !isTapIcon!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadiusTextForm),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: sizeTextForm,
              ),
            ),
          ),
        ),
        Visibility(
          visible: iconInfo != null,
          child: GestureDetector(
            child: Icon(
              Icons.info_outline,
              size: 20,
              color: Colors.grey.shade600,
            ),
            onTap: () {
              const snackBar = SnackBar(
                content: Text('Ingrese su nueva contraseña'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Visibility(
          visible: iconEye != null,
          child: GestureDetector(
            onTap: onTapEye,
            child: Icon(
              icon,
              size: 20,
              color: Colors.grey.shade600,
            ),
          ),
        )
      ]),
    );
  }
  Widget _customTextFormField({
    required String hintText,
    String? initialValue,
    TextInputType? keyboardType = TextInputType.text,
    bool? obscureText,
    String? Function(String?)? validator,
    double? fontSize = 14,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: initialValue,
        style: TextStyle(fontSize: fontSize),
        obscureText: !(obscureText == null),
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _textFormField(
      String initialValue, String hintText, TextInputType keyboardType,
      {bool? obscureText, validator}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: initialValue,
        style: const TextStyle(fontSize: 14),
        obscureText: !(obscureText == null),
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        validator: validator,
      ),
    );
  }
}