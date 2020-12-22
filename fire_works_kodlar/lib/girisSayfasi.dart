import 'package:fire_works/models/kullanici.dart';
import 'package:fire_works/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GirisSayfasi extends StatelessWidget {
  anonimGirisYap(BuildContext context) async {
    BenimAuthServisim _benimAuthServisim =
        Provider.of<BenimAuthServisim>(context, listen: false);
    Kullanici kullanici = await _benimAuthServisim.anaonimGiris();
    //return kullanici.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 120,
          height: 80,
          color: Colors.grey,
          child: Center(
            child: InkWell(
                onTap: () => anonimGirisYap(context), child: Text("Giriş Yap")),
          ),
        ),
      ),
    );
  }
}
