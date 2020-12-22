import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Kullanici {
  final String id;
  final String isim;
  final String soyisim;
  final String avatar;
  final String eposta;

  Kullanici({this.id, this.isim, this.soyisim, this.avatar, this.eposta});

  factory Kullanici.dokumandanUret(DocumentSnapshot doc) {
    return Kullanici(
      id: doc.documentID,
      isim: doc.data["isim"],
      soyisim: doc.data["soyisim"],
      eposta: doc.data["mail"],
      avatar: doc.data["avatar"],
    );
  }

  factory Kullanici.firebasedenUret(FirebaseUser kullanici) {
    return Kullanici(
      id: kullanici.uid,
      isim: kullanici.displayName,
      eposta: kullanici.email,
      avatar: kullanici.photoUrl,
    );
  }
}
