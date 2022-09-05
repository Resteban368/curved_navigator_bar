import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../theme/AppTheme.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _pageIndex = 0;
  // ignore: prefer_final_fields
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget _showPage = const Page1Screen();

  Widget? _seleccionarPagiona(int page) {
    switch (page) {
      case 0:
        return const Page1Screen();
      case 1:
        return const Page2Screen();
      case 2:
        return const Page3Screen();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _pageIndex,
        height: 55.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.account_circle_rounded, size: 30, color: Colors.white),
        ],
        color: AppTheme.primary,
        buttonBackgroundColor: AppTheme.primary, //color de iconos activados
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _seleccionarPagiona(tappedIndex)!;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.white,
        child: _showPage,
      ),
    );
  }
}
