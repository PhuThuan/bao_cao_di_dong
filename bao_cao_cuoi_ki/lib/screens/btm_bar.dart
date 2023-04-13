import 'package:bao_cao_cuoi_ki/provider/dart_theme_provider.dart';
import 'package:bao_cao_cuoi_ki/screens/cart.dart';
import 'package:bao_cao_cuoi_ki/screens/categories.dart';
import 'package:bao_cao_cuoi_ki/screens/home.dart';
import 'package:bao_cao_cuoi_ki/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 3;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': const CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'}
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   _pages[_selectedIndex]['title'],
      // )),
      //thanh phia duoi bottom theme
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          // mau background
          backgroundColor: themeState.getDarkTheme
              ? Theme.of(context).cardColor
              : Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          // kiem tra dang che do nao de hien thi mau cho cac item
          // item khong duoc chon
          unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
          // item dc chon
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.black87,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: "User",
            ),
          ]),
    );
  }
}
