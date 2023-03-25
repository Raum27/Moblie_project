import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'aricle_text.dart';

class Phone_layout extends StatefulWidget {
  const Phone_layout({super.key});

  @override
  State<Phone_layout> createState() => _Phone_layoutState();
}

class _Phone_layoutState extends State<Phone_layout> {
  var _phone_number = '';
  var mode = true;
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 100.0,
                      color: mode == true
                          ? Color.fromARGB(255, 73, 73, 73)
                          : Color.fromARGB(255, 245, 245, 245),
                    ),
                    Text("กรุณาใส่รัหสผ่าน",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: mode == true
                                ? Color.fromARGB(255, 73, 73, 73)
                                : Color.fromARGB(255, 245, 245, 245))),
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
              )
            ],
          ),
          Padding(
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
          Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextButton(
                      child: Text('สมัคร'),
                      onPressed: () {
                        print('Pressed');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextButton(
                      child: Text('ล็อคอิน'), // ต้องมีการเช็คเงื่อนไขตรงนี้
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Aricle_text(
                                    mode:
                                        mode))); /////////////////////////////////////////
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildRow(List<String> numberList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // collection for

        for (var i = 0; i < numberList.length; i++) _buildButton(numberList[i]),
      ],
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
