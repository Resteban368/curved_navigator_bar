import 'package:flutter/material.dart';

import '../theme/AppTheme.dart';

class CardContactos extends StatelessWidget {
  const CardContactos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      // color: Colors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Contactos favoritos',
              style: TextStyle(fontSize: 15, color: AppTheme.primary)),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return _Contactos(index);
            },
          ),
        ),
      ]),
    );
  }
}

class _Contactos extends StatelessWidget {
  int index;
  _Contactos(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> urlImages = [
      'https://play-lh.googleusercontent.com/5e7z5YCt7fplN4qndpYzpJjYmuzM2WSrfs35KxnEw-Ku1sClHRWHoIDSw3a3YS5WpGcI',
      'https://cms-assets.tutsplus.com/uploads/users/1499/posts/27926/preview_image/firebase_logo.png',
      'https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU',
      'https://aquiensistemas.com/wp-content/uploads/2021/01/pp.png',
      'https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc',
      'https://play-lh.googleusercontent.com/UrY7BAZ-XfXGpfkeWg0zCCeo-7ras4DCoRalC_WXXWTK9q5b0Iw7B0YQMsVxZaNB7DM',
      'https://www.muycomputer.com/wp-content/uploads/2020/06/twitch-1000x600.jpg'
    ];
    return Container(
      width: 100,
      height: 150,
      // color: Color.fromARGB(255, 91, 219, 17),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage(
                placeholder: Image.network(urlImages[index]).image,
                image: Image.network(urlImages[index]).image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            'esteban rpdriguez marles',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
