import 'package:fire_works/models/kullanici.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FireWorks",
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final db = Firestore.instance;

  void kullanicilariGetir() async {
    var snapShot = await db.collection("kullanicilar").getDocuments();
    snapShot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kimlikIleKullanicilariGetir() async {
    var doc = await db
        .collection("kullanicilar")
        .document("tUZDBRujLtnNidOG428V")
        .get();
    if (doc.exists) {
      print(doc.data);
    } else {
      print("Böyle bir döküman bulunmuyor");
    }
  }

  void kullanicilariSirala() async {
    var snapShot =
        await db.collection("kullanicilar").orderBy("yas").getDocuments();
    snapShot.documents.forEach((doc) {
      print(doc.data["yas"]);
    });
  }

  void kullaniciSorgula() async {
    var snapShot = await db
        .collection("kullanicilar")
        .where("yas", isEqualTo: "19")
        .getDocuments();
    snapShot.documents.forEach((doc) {
      print(doc.data);
    });
  }

  void kullaniciOlustur() async {
    var doc = await db
        .collection("kullanicilar")
        .document("tUZDBRujLtnNidOG428V")
        .get();
    Kullanici kullanici1 = Kullanici.dokumandanUret(doc);

    print(kullanici1.id);
    print(kullanici1.isim);
    print(kullanici1.soyisim);
    print(kullanici1.eposta);
    print(kullanici1.avatar);
  }

  @override
  void initState() {
    super.initState();
    kullaniciOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
