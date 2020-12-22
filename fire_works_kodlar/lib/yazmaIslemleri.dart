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

  kullaniciEkle() {
    db.collection("kullanicilar").add({
      "isim": "Mustafa",
      "soyisim": "Poyraz",
      "mail": "mustafa.poyraz@gmail.com",
    });
  }

  kimlikIleKullaniciEkle() {
    db.collection("kullanicilar").document("abc").setData({
      "isim": "Feyzullah",
      "soyisim": "Altınok",
      "mail": "feyzullahaltinok@gmail.com",
    });
  }

  kullaniciGuncelleme() {
    db.collection("kullanicilar").document("abc").updateData({
      "isim": "Feyzo",
      "soyisim": "Altin",
      "mail": "altinok.feyzo@gmail.com",
    });
  }

  kullaniciSil() {
    db.collection("kullanicilar").document("tUZDBRujLtnNidOG428V").delete();
  }

  @override
  void initState() {
    super.initState();
    kullaniciSil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("kullanicilar").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<Kullanici> kullanicilar = snapshot.data.documents
              .map((doc) => Kullanici.dokumandanUret(doc))
              .toList();

          return ListView.builder(
            itemCount: kullanicilar.length,
            itemBuilder: (context, position) {
              return ListTile(
                title: Text(kullanicilar[position].isim +
                    " " +
                    kullanicilar[position].soyisim),
                subtitle: Text(kullanicilar[position].eposta),
              );
            },
          );
        },
      ),
    );
  }
}
