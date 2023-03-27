import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p_anonymus/module/contents.dart';
import 'package:p_anonymus/module/test.dart';
import '../services/api_client.dart';
import 'aricle_contents.dart';

class Aricle_text extends StatefulWidget {
  var mode;
  Aricle_text({super.key, required this.mode});
  @override
  State<Aricle_text> createState() => _Aricle_textState(mode);
}

class _Aricle_textState extends State<Aricle_text> {
  var mode = false;
  List<Contents>? _content_text;
  List<Testapi>? _testapi;
  var _isloading = false;
  _Aricle_textState(this.mode);

  void loaddata() async {
    _content_text = await ApiClient().getAllcontents();

    setState(() {
      Future.delayed(Duration(seconds: 2));
      _isloading = true;
    });
  }

  void initState() {
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    print("hhhhhhhhhhhhhhhhhhhhhh");
    print(_isloading);
    return Scaffold(
        appBar: AppBar(title: Text('บทความ')),
        backgroundColor: mode == true
            ? Color.fromARGB(255, 245, 245, 245)
            : Color.fromARGB(255, 73, 73, 73),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
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
              ],
            ),
            _content_text == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    width: 400,
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: _content_text!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Genarate_widget(
                              _content_text![index], context, mode);
                        },
                      ),
                    ),
                  ),
          ],
        ));
  }
}

Widget Genarate_widget(Contents c, BuildContext context, var mode) {
  var style_1 = const TextStyle(fontSize: 12, color: Colors.black54);
  var title = c.title;
  var detail = c.contents;
  var image = c.image;
  return Card(
    color: mode == true
        ? Color.fromARGB(255, 245, 245, 245)
        : Color.fromARGB(255, 233, 183, 47),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Text_contents(
                      contents: c,
                      mode: mode,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row(
            children: [
              Image.network(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${title}'),
                      Text(
                        '${detail}',
                        overflow: TextOverflow.ellipsis,
                        style: style_1,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    ),
  );
}
