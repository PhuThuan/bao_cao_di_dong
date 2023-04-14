import 'package:bao_cao_cuoi_ki/login/login_page.dart';
import 'package:bao_cao_cuoi_ki/provider/dart_theme_provider.dart';
import 'package:bao_cao_cuoi_ki/services/global_methods.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextEditingController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _addressTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi,  ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Tran phu thuan",
                          style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // print('My name is pressed');
                            }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'thuan@gmailc',
                  color: color,
                  textSize: 18,
                  // isTitle: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTiles(
                  title: 'Address',
                  titleSubtitle: 'Subtitle here',
                  iconLeading: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
                ListTiles(
                  title: 'Orders',
                  iconLeading: IconlyLight.bag,
                  onPressed: () {},
                  color: color,
                ),
                ListTiles(
                  title: 'Wishlist',
                  iconLeading: IconlyLight.heart,
                  onPressed: () {},
                  color: color,
                ),
                ListTiles(
                  title: 'Viewed',
                  iconLeading: IconlyLight.show,
                  onPressed: () {},
                  color: color,
                ),
                SwitchListTile(
                  title: Text(themeState.getDarkTheme
                      ? 'Bật chế độ sáng'
                      : 'Bật chế độ tối'),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  // thay doi nen
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                ),
                ListTiles(
                  title: 'Forget Password',
                  iconLeading: IconlyLight.unlock,
                  onPressed: () {},
                  color: color,
                ),
                ListTiles(
                  title: 'Logout',
                  iconLeading: IconlyLight.logout,
                  onPressed: () async {
                    await _showLogoutDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logout.jpg',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Thoát'),
              ],
            ),
            content: const Text('bạn có muốn thoát'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'Hủy bỏ',
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {GlobalMethods.navigateTo(
                            ctx: context, routeName: LoginPage.routeName);},
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'Ok',
                  textSize: 18,
                ),
              ),
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              // onChanged: (value) {
              //   print(
              //       '_addressTextController.text ${_addressTextEditingController.text}');
              // },
              controller: _addressTextEditingController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              )
            ],
          );
        });
  }

  Widget ListTiles({
    required String title,
    String? titleSubtitle,
    required IconData iconLeading,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        text: titleSubtitle == null ? "" : titleSubtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(iconLeading),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
