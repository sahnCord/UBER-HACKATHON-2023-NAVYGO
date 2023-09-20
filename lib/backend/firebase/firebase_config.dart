import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCiM0cAw5uSYHjm5VhrUYiWcGMP51ic2Ds",
            authDomain: "uber-hackathon-backend.firebaseapp.com",
            projectId: "uber-hackathon-backend",
            storageBucket: "uber-hackathon-backend.appspot.com",
            messagingSenderId: "1826990738",
            appId: "1:1826990738:web:948b559b421e323519944b",
            measurementId: "G-LWGCLNTV32"));
  } else {
    await Firebase.initializeApp();
  }
}
