import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'BranchPage.dart';
import 'CustomerPage.dart';
import 'HomePage.dart';
import 'PendingServiceOrderPage.dart';
import 'ServiceOrderPage.dart';
import 'FinishedServiceOrderPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'S7YhLq56bTmBhlAXSZdMWkWd39rPxB2P2uzj9vco';
  final keyClientKey = 'bqHWaZb31krY9ndaCbaS4F8TQ24kpDLG3p4B2yg1';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  var firstObject = ParseObject('NewClass')
    ..set('message', 'Primeira mensagem enviada pelo desktop');
  await firstObject.save();

  print('done');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Login',
      routes: {
        '/HomePage': (context) => HomePage(),
        '/Login': (context) => Login(),
        '/ServiceOrderPage': (context) => ServiceOrderPage(),
        '/CustomerPage': (context) => CustomerPage(),
        '/BranchPage': (context) => BranchPage(),
        '/FinishedServiceOrderPage': (context) => FinishedServiceOrderPage(),
        '/PendingServiceOrderPage': (context) => PendingServiceOrderPage(),
      },
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('asset/images/FixIt.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    hintText: 'Digite um email válido, ex: abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 10,
                bottom: 0,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    hintText: 'Digite sua senha'),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Esqueceu sua senha?',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/BranchPage');
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Text('Novo usuário? Criar conta nova')
          ],
        ),
      ),
    );
  }
}
