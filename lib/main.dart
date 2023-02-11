import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int fn = 0;
  int sn = 0;
  String res = "";
  String tod = "";
  String otp = "";
  void btnclicked(String btnval) {
    if (btnval == "c") {
      tod = "";
      fn = 0;
      sn = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      fn = int.parse(tod);
      res = "";
      otp = btnval;
    } else if (btnval == "=") {
      sn = int.parse(tod);
      if (otp == "+") {
        res = (fn + sn).toString();
      }
      if (otp == "-") {
        res = (fn - sn).toString();
      }
      if (otp == "x") {
        res = (fn * sn).toString();
      }
      if (otp == "/") {
        res = (fn / sn).toString();
      }
    } else {
      res = int.parse(tod + btnval).toString();
    }
    setState(() {
      tod = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlinedButton(
        //padding: const EdgeInsets.all(25.0)
        onPressed: () => btnclicked(btnval),
        child: Text(
          btnval,
          style: const TextStyle(fontSize: 60.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULATOR'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                tod,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
            Row(
              children: [
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("/"),
              ],
            ),
            Row(
              children: [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("c"),
                custombutton("0"),
                custombutton("="),
                custombutton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
