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
  anonimGirisYap() async {
    // ignore: unused_local_variable
    AuthResult authResult = await FirebaseAuth.instance.signInAnonymously();
    // print(authResult.user.uid);
    // print(authResult.user.email);
    // print(authResult.user.displayName);
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
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          print(snapshot.data.uid);
          return anaSayfa();
        } else {
          return girisSayfasi();
        }
      },
    );
  }
}
