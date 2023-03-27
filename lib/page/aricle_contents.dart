import 'package:flutter/material.dart';
import 'package:p_anonymus/module/contents.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p_anonymus/services/api_client.dart';

import '../module/textsummary.dart';

class Text_contents extends StatefulWidget {
  final Contents contents;
  var mode;
  Text_contents({super.key, required this.contents, required this.mode});

  @override
  State<Text_contents> createState() => _Text_contentsState(mode);
}

class _Text_contentsState extends State<Text_contents> {
  var mode;
  var _isnotsummarizer = false;
  Textsummarizer? _text_summarizer;
  _Text_contentsState(this.mode);
  void loadsummarizer() async {
    _text_summarizer = await ApiClient().summarizer();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var title = widget.contents.title;
    var detail = widget.contents.contents;
    var image = widget.contents.image;
    return Scaffold(
      appBar: AppBar(
        title: Text('${title}'),
      ),
      backgroundColor: mode == true
          ? Color.fromARGB(255, 245, 245, 245)
          : Color.fromARGB(255, 73, 73, 73),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              alignment: Alignment.topLeft,
              icon: FaIcon(FontAwesomeIcons.sun,
                  color: mode == true
                      ? Color.fromARGB(255, 255, 174, 0)
                      : Color.fromARGB(255, 229, 229, 230)),
              onPressed: () {
                mode = !mode;
                setState(() {});
              }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${title}',
                          style: TextStyle(
                            fontSize: 20,
                            color: mode == true
                                ? Color.fromARGB(255, 73, 73, 73)
                                : Color.fromARGB(255, 245, 245, 245),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Image.network(
                            image,
                            // fit: BoxFit.cover,
                            height: 350,
                            width: 550,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: 500,
                            child: Expanded(
                              // flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${detail}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: mode == true
                                        ? Color.fromARGB(255, 73, 73, 73)
                                        : Color.fromARGB(255, 245, 245, 245),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isnotsummarizer = true;
                              loadsummarizer();
                            });
                          },
                          child: Text('สรุปบทความ')),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _text_summarizer == null
                        ? const Text("")
                        : Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12.0),
                                  child: Text(
                                    '${_text_summarizer!.contents}',
                                    style: TextStyle(
                                      color: mode == true
                                          ? Color.fromARGB(255, 73, 73, 73)
                                          : Color.fromARGB(255, 253, 174, 3),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: 750,
                                  height: 5,
                                  color: Color.fromARGB(255, 72, 166, 243),
                                  // child: Row(),
                                ),
                              ],
                            ),
                          ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 550,
                    child: Column(children: [
                      Text(
                        'แชร์ให้เพื่อน',
                        style: TextStyle(
                          color: mode == true
                              ? Color.fromARGB(255, 73, 73, 73)
                              : Color.fromARGB(255, 253, 174, 3),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.line,
                                    color: Colors.green),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.blue),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                icon: FaIcon(FontAwesomeIcons.twitter,
                                    color: Color.fromARGB(255, 87, 162, 241)),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          )
                        ],
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
