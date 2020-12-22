import 'package:fire_works/anaSayfa.dart';
import 'package:fire_works/girisSayfasi.dart';
import 'package:fire_works/models/kullanici.dart';
import 'package:fire_works/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YonlendirmeSayfasi extends StatefulWidget {
  @override
  _YonlendirmeSayfasiState createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          Provider.of<BenimAuthServisim>(context, listen: false).durumTakipcisi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          Kullanici aktifKullanici = snapshot.data;
          print(aktifKullanici.id);
          return AnaSayfa();
        } else {
          return GirisSayfasi();
        }
      },
    );
  }
}
