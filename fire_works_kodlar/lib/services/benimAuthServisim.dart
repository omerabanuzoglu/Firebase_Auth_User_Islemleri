import 'package:fire_works/models/kullanici.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BenimAuthServisim {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Kullanici _kullaniciOlustur(FirebaseUser firebaseKullanici) {
    return firebaseKullanici == null
        ? null
        : Kullanici.firebasedenUret(firebaseKullanici);
  }

  Stream<Kullanici> get durumTakipcisi {
    return _firebaseAuth.onAuthStateChanged.map((_kullaniciOlustur));
  }

  Future<Kullanici> anaonimGiris() async {
    var authResult = await _firebaseAuth.signInAnonymously();
    return _kullaniciOlustur(authResult.user);
  }

  Future<void> cikisYap() {
    return _firebaseAuth.signOut();
  }
}
