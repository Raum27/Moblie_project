import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p_anonymus/page/register.dart';
import 'package:p_anonymus/services/api_client.dart';
import '../module/checkiduser.dart';
import '../module/test.dart';
import 'aricle_text.dart';

class Phone_layout extends StatefulWidget {
  const Phone_layout({super.key});

  @override
  State<Phone_layout> createState() => _Phone_layoutState();
}

class _Phone_layoutState extends State<Phone_layout> {
  var _phone_number = '';
  var mode = true;
  UserIDcheck? checkIDuser;
  List<Testapi>? _testapi;
  static var cc = '#1123';
  void check_USer() async {
    checkIDuser = await ApiClientServer().login(_phone_number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mode == true
          ? Color.fromARGB(255, 245, 245, 245)
          : Color.fromARGB(255, 73, 73, 73),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  icon: FaIcon(FontAwesomeIcons.sun,
                      color: mode == true
                          ? Color.fromARGB(255, 255, 174, 0)
                          : Color.fromARGB(255, 229, 229, 230)),
                  onPressed: () {
                    mode = !mode;
                    setState(() {});
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CIA หน่วยข่าวกรองแห่งชาด",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: mode == true
                                  ? Color.fromARGB(255, 53, 53, 53)
                                  : Color.fromARGB(255, 255, 174, 0))),
                      Icon(
                        Icons.person_4_rounded,
                        size: 100.0,
                        color: mode == true
                            ? Color.fromARGB(255, 61, 61, 61)
                            : Color.fromARGB(255, 255, 174, 0),
                      ),
                      Text("กรุณาใส่รัหสผ่าน",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: mode == true
                                  ? Color.fromARGB(255, 53, 53, 53)
                                  : Color.fromARGB(255, 255, 174, 0))),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          '$_phone_number',
                          style: TextStyle(
                              fontSize: 20,
                              color: mode == true
                                  ? Color.fromARGB(255, 73, 73, 73)
                                  : Color.fromARGB(255, 245, 245, 245)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  ['1', '2', '3'],
                  ['4', '5', '6'],
                  ['7', '8', '9'],
                  ['#', '0', 'x']
                ].map((item) => _buildRow(item)).toList(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: TextButton(
                        child: Text('สมัคร'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterNumber()));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: TextButton(
                        child: Text('ล็อคอิน'), // ต้องมีการเช็คเงื่อนไขตรงนี้
                        onPressed: () {
                          check_USer();
                          setState(() {
                            if (checkIDuser!.status == true) {
                              print("successful");
                              _phone_number = '';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Aricle_text(mode: mode)));
                            } else {
                              check_ID();
                              // setState(() {});
                            }
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> numberList) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // collection for

          for (var i = 0; i < numberList.length; i++)
            _buildButton(numberList[i]),
        ],
      ),
    );
  }

  Widget _buildButton(String number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _phone_number += number;
          if (number == 'x') {
            _phone_number =
                _phone_number.substring(0, _phone_number.length - 2);
          }
          setState(() {});
        },
        child: Center(
          child: Text(number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  void check_ID() {
    _showSnackBar(
      'เบอร์มือถือนี้ยังไม่ได้ลงทะเบียน  หรือ ใส่ไม่ถูกต้อง!!!',
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
  }

  void _showSnackBar(String message,
      {int? durationSeconds, SnackBarAction? action}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
              color: mode == true
                  ? Color.fromARGB(255, 245, 245, 245)
                  : Color.fromARGB(255, 255, 174, 0)),
        ),
        duration: Duration(seconds: 3),
        action: action,
      ),
    );
  }
}
