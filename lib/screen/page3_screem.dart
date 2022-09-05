import 'package:flutter/material.dart';

import '../theme/AppTheme.dart';

class Page3Screen extends StatelessWidget {
  const Page3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url =
        'https://instagram.fclo9-1.fna.fbcdn.net/v/t51.2885-19/301629228_1206701253511668_4705098478327405601_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fclo9-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=a2Y3sBj0_cwAX8dLgXq&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT_h_sDeyVlMHub5E9layMy_si1HpAebzwatXQ0EXWaNYw&oe=631CE93C&_nc_sid=8fd12b';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: const Text('Acount'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const FotoPerfil(
                urlimagen: url,
              ),
              const SizedBox(height: 20),
              const Text(
                'Baneste_codes',
                style: TextStyle(fontSize: 30, color: AppTheme.primary),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: const [
                    BuildTextFiled(
                      labelText: "Nombre",
                      placeholder: "",
                    ),
                    BuildTextFiled(
                      labelText: "Apellidos",
                      placeholder: '',
                    ),
                    BuildTextFiled(
                      labelText: "Correo Institucional",
                      placeholder: '',
                    ),
                    BuildTextFiled(
                      labelText: "Correo Personal",
                      placeholder: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FotoPerfil extends StatelessWidget {
  final String urlimagen;
  const FotoPerfil({
    Key? key,
    required this.urlimagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
          border:
              Border.all(width: 4, color: Color.fromARGB(255, 122, 138, 226)),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1)),
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(urlimagen).image,
          )),
    );
  }
}

class BuildTextFiled extends StatelessWidget {
  final String labelText;
  final String placeholder;
  const BuildTextFiled({
    Key? key,
    required this.labelText,
    required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppTheme.primary, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }
}
