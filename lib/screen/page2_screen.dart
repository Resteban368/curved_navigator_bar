import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../search/contactosBusqueda.dart';
import '../theme/AppTheme.dart';
import '../widgets/widgest.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //para ver el tamaño de la pantalla
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: AppTheme.primary,
        actions: [
          NamedIcon(
            iconData: Icons.notifications,
            notificationCount: 5,
            onTap: () {},
          ),
        ],
      ),
      body: Scaffold(
        body: ChatBackground(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 15),
                _BarraBuscar(),
                SizedBox(height: 15),
                CardContactos(),
                _ContenedorBotones(),
                _ContenedorListChat(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// //consulta a la bd para obtener las categorias de los cursos
// void getCtaegories(MySqlConnection conn) async {
//   var results = await conn.query('SELECT * FROM mdl_course_categories');
//   for (var row in results) {
//     print(row);
//   }
// }

//todo widget de card
class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: double.infinity,
        height: size.height * 0.8,
        decoration: _createCardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}

class _ContenedorListChat extends StatelessWidget {
  const _ContenedorListChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista de  url de imagenes
    final List<String> urlImages = [
      'https://play-lh.googleusercontent.com/5e7z5YCt7fplN4qndpYzpJjYmuzM2WSrfs35KxnEw-Ku1sClHRWHoIDSw3a3YS5WpGcI',
      'https://cms-assets.tutsplus.com/uploads/users/1499/posts/27926/preview_image/firebase_logo.png',
      'https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU',
      'https://aquiensistemas.com/wp-content/uploads/2021/01/pp.png',
      'https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc',
      'https://play-lh.googleusercontent.com/UrY7BAZ-XfXGpfkeWg0zCCeo-7ras4DCoRalC_WXXWTK9q5b0Iw7B0YQMsVxZaNB7DM',
      'https://www.muycomputer.com/wp-content/uploads/2020/06/twitch-1000x600.jpg'
    ];

    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.62,
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int i) {
                  return ElasticInDown(
                    child: Stack(
                      children: [
                        Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: FadeInImage(
                                placeholder: Image.network(urlImages[i]).image,
                                image: Image.network(urlImages[i]).image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text('Baneste_codes',
                                style: TextStyle(color: AppTheme.primary)),
                            subtitle: const Text('Hola como estas?'),
                            trailing: const Text('2:45'),
                            onTap: () {},
                          ),
                        ),
                        //onlie
                        Positioned(
                          top: 9,
                          right: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}

class _BarraBuscar extends StatelessWidget {
  const _BarraBuscar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: ContactosDeBusqueda());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Buscar Contactos',
                    style: TextStyle(color: AppTheme.primary, fontSize: 15)),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: AppTheme.primary,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: ContactosDeBusqueda());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContenedorBotones extends StatelessWidget {
  const _ContenedorBotones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.04,
      child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ElevatedButton(
              onPressed: () {
                //ruta a la pantalle de crear grupo
                Navigator.pushNamed(context, 'grupos');
              },
              // ignore: sort_child_properties_last
              child: const Text(
                "Grupos",
                style: TextStyle(
                    fontSize: 15, letterSpacing: 2, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppTheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ))),
    );
  }
}
