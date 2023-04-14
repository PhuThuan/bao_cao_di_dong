import 'package:bao_cao_cuoi_ki/login/comm/button_page.dart';
import 'package:bao_cao_cuoi_ki/login/comm/text_form_field.dart';
import 'package:bao_cao_cuoi_ki/login/helper/helper_fuction.dart';
import 'package:bao_cao_cuoi_ki/login/login_page.dart';
import 'package:bao_cao_cuoi_ki/services/global_methods.dart';
import 'package:bao_cao_cuoi_ki/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SiginUpPage extends StatefulWidget {
  static const routeName = "/SiginUpPageState";
  const SiginUpPage({super.key});

  @override
  State<SiginUpPage> createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> globalKey1 = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController comfirmpass = TextEditingController();
  late UserCredential userCredential;
  bool loading = false;
  Future sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.text, password: password.text);
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user?.uid)
          .set({
        'name': name.text.trim(),
        'user': user.text.trim(),
        'userid': userCredential.user?.uid,
        'password': password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        alertDialog(context, 'mật khẩu quá yếu');
      } else if (e.code == 'email-already-in-use') {
        alertDialog(context, 'tài khoản đã có');
      }
    } catch (e) {
      Object a = e;
      alertDialog(context, 'a');
      setState(() {
        loading = false;
      });
    }
  }

  void validation() {
    if (globalKey1.currentState!.validate()) {
      if (password.text != comfirmpass.text) {
        alertDialog(context, 'nhập lại mật khẩu');
      }
      setState(() {
        alertDialog(context, 'Thành công');
      });

      sendData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text('EASY SHOP'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            GlobalMethods.navigateTo(
                ctx: context, routeName: LoginPage.routeName);
          },
        ),
      ),
      body: Form(
        key: globalKey1,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Đăng Ký",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 80,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormFieldLogIn(
                      controller: name,
                      hintname: 'Họ và tên của bạn',
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFieldLogIn(
                      controller: user,
                      hintname: 'Tài khoản Gmail',
                      icon: Icons.person,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFieldLogIn(
                      controller: password,
                      hintname: 'Mật khẩu',
                      icon: Icons.lock,
                      isobscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFieldLogIn(
                      controller: comfirmpass,
                      hintname: 'Nhập lại mật khẩu',
                      icon: Icons.lock,
                      isobscureText: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ButtonPage(
                        title: 'Hủy bỏ',
                        colorBotton: Colors.grey,
                        colorText: Colors.white,
                        colorBorder: Colors.white,
                        Onpressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ButtonPage(
                        title: 'Đăng Ký',
                        colorBotton: Colors.red,
                        colorText: Colors.white,
                        colorBorder: Colors.white,
                        Onpressed: validation,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn đã có tài khoản ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            ctx: context, routeName: LoginPage.routeName);
                      },
                      child: TextWidget(
                        text: 'bạn đã có tài khoản',
                        maxLines: 1,
                        color: Colors.blue,
                        textSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
