import 'package:flutter/material.dart';
import 'controlPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Control(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final FirebaseApp app = await Firebase.initializeApp(
//     name: 'db2',
//     options: Platform.isIOS || Platform.isMacOS
//         ? FirebaseOptions(
//       appId: '1:297855924061:ios:c6de2b69b03a5be8',
//       apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
//       projectId: 'flutter-firebase-plugins',
//       messagingSenderId: '297855924061',
//       databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
//     )
//         : FirebaseOptions(
//       appId: '1:297855924061:android:669871c998cc21bd',
//       apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
//       messagingSenderId: '297855924061',
//       projectId: 'flutter-firebase-plugins',
//       databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
//     ),
//   );
//   runApp(MaterialApp(
//     title: 'Flutter Database Example',
//     home: MyHomePage(app: app),
//   ));
// }
