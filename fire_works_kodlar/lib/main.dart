import 'package:fire_works/services/benimAuthServisim.dart';
import 'package:fire_works/yonlendirmeSayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<BenimAuthServisim>(
      create: (_) => BenimAuthServisim(),
      child: MaterialApp(
        title: "FireWorks",
        debugShowCheckedModeBanner: false,
        home: YonlendirmeSayfasi(),
      ),
    );
  }
}
