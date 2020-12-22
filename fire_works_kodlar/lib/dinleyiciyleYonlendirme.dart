import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FireWorks",
      debugShowCheckedModeBanner: false,
      home: YonlendirmeSayfasi(),
    );
  }
}

class YonlendirmeSayfasi extends StatefulWidget {
  @override
  _YonlendirmeSayfasiState createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  bool isAuth = false;

  anonimGirisYap() async {
    AuthResult authResult = await FirebaseAuth.instance.signInAnonymously();
    print(authResult.user.uid);
    print(authResult.user.email);
    print(authResult.user.displayName);
  }

  cikisYap() {
    FirebaseAuth.instance.signOut();
  }

  Widget girisSayfasi() {
    return Scaffold(
      body: Center(
        child: Container(
          width: 120,
          height: 80,
          color: Colors.grey,
          child: Center(
            child: InkWell(
                onTap: () => anonimGirisYap(), child: Text("Giriş Yap")),
          ),
        ),
      ),
    );
  }

  Widget anaSayfa() {
    return Scaffold(
      body: Center(
        child: InkWell(onTap: () => cikisYap(), child: Text("Çıkış Yap")),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((kullanici) {
      if (kullanici != null) {
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? anaSayfa() : girisSayfasi();
  }
}
