import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login.dart';

class RegisterNumber extends StatefulWidget {
  const RegisterNumber({super.key});

  @override
  State<RegisterNumber> createState() => _RegisterNumberState();
}

class _RegisterNumberState extends State<RegisterNumber> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("สมัครเป็นสมาชิก")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'ใส่หมายเลขโทรศัพท์'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Expanded(
                child: OutlinedButton.icon(
                    onPressed: home,
                    icon: Icon(Icons.cancel_outlined),
                    label: const Text("ยกเลิก")),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Expanded(
                child: OutlinedButton.icon(
                    onPressed: () {
                      check_Phonenumber(_controller.text);
                    },
                    icon: Icon(Icons.add),
                    label: const Text("ยืนยันหมายเลข")),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void check_Phonenumber(var str) {
    if (str.toString().length != 10) {
      _showSnackBar(
        'หมายเลขโทรศัพท์ไม่ถูกต้อง !',
        3,
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            setState(() {});
          },
        ),
      );
      return null;
    }
    for (var i = 0; i < str.toString().length; ++i) {
      if (!RegExp(r'\d').hasMatch(str[i])) {
        _showSnackBar(
          'หมายเลขโทรศัพท์ไม่ถูกต้อง !',
          3,
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              setState(() {});
            },
          ),
        );
        return null;
      }
    }
    _showSnackBar(
      'สมัครสำเร็จ กำลังเข้าสู่หน้าหลัก . . .',
      1,
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );

    home();
  }

  void home() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Phone_layout()));
  }

  void _showSnackBar(String message, int x,
      {int? durationSeconds, SnackBarAction? action}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: x),
        action: action,
      ),
    );
  }
}
