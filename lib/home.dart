import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'firstpage.dart';
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String msg;
  String msg1;
  String msgfinal;
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera
  String currentTtsString;
  double ttsSpeechRate1 = 0.5;
  double ttsSpeechRate2 = 1.0;
  double currentSpeechRate;
  bool bolSpeaking = false;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 8, //the amout of categories our neural network can predict
      threshold: 0.45,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    // _getall();
    setState(() {
      _output = output;

      _loading = false;
    });
    _data = '';
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
        model: 'assets/model_blood_cells_8.tflite',
        labels: 'assets/labels.txt');
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: new Image.asset('icons/exit.png'),
            tooltip: 'Exit',
            onPressed: () {
              exit(0);
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.white60, Colors.redAccent])),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Upload Microscopic Blood Cells Image',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.8),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x0FFC2CEA),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: _loading == true
                        ? null //show nothing if no picture selected
                        : Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white54,
                                        blurRadius: 20.0, // soften the shadow
                                        spreadRadius: 3.0, //extend the shadow
                                        offset: Offset(
                                          5.0, // Move to right 10  horizontally
                                          5.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),

                                  // ),
                                  height: 250,
                                  width: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                // read texts file
                                Divider(
                                  height: 2,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  width: 80,
                                ), //Column

                                Divider(
                                  height: 20,
                                  thickness: 2,
                                ),
                                if (_output[0]['confidence'] >= 0.46)
                                  Card(
                                    elevation: 50,
                                    shadowColor: Colors.redAccent,
                                    color: Colors.white60,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 450,
                                      height: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'The Blood Cell Type is : ${_output[0]['label']}\n Score                : ${(_output[0]['confidence'] * 100).toStringAsFixed(2) + ' %'}\n ', //2- The  disease   is : ${_output[1]['label']}\n    Prob.                       : ${(_output[1]['confidence'] * 100).toStringAsFixed(2) + '%'}\n ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),

                                            SizedBox(
                                              width: 80,
                                            ) //SizedBox
                                          ],
                                        ), //Column
                                      ), //Padding
                                    ), //SizedBox
                                  )
                                else
                                  Card(
                                    elevation: 50,
                                    shadowColor: Colors.green,
                                    color: Colors.white54,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 350,
                                      height: 135,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              ' The image not clear ?? \n the accuracy less than 50 % \n try again !! \n',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 80,
                                            )
                                          ],
                                        ), //Column
                                      ), //Padding
                                    ), //SizedBox
                                  )
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade100,
                              borderRadius: BorderRadius.circular(15)),
                          child: new Image.asset('icons/gallery.png')),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // });
  }

//
  void _showNot(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Chest Info. ',
              //  textDirection: TextDirection.rtl,
            ),
            content: Scrollbar(
              child: Card(
                elevation: 50,
                shadowColor: Colors.greenAccent[100],
                color: Colors.greenAccent[100],
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.greenAccent[100],
                          radius: 108,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/front.png"),
                            radius: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          ' No found info.  ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500,
                          ),
                          //  textDirection: TextDirection.rtl, //Textstyle
                        ), //Text

                        SizedBox(
                          width: 120,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstRoute()),
                              );
                            }, //=> null,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app),
                                  Text('Ok'),
                                ],
                              ), //Row
                            ), //Padding
                          ), //RaisedButton
                        ) //SizedBox
                      ],
                    ), //Column
                  ), //Padding
                ), //SizedBox
              ), //Card
            ),
          );
        });
  }

  String _data;

  // This function is triggered when the user presses the floating button
  _loadData(String _filename) async {
    final _loadedData =
        await rootBundle.loadString('texts/$_filename' + '.txt');
    setState(() {
      _data = _loadedData;
      print(_data);
    });
  }

  // shoe load file

  void _showResultHelp(String text, String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              text,
              //  textDirection: TextDirection.rtl,
            ),
            content: Scrollbar(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 50,
                shadowColor: Colors.greenAccent[100],
                color: Colors.greenAccent[100],
                child: SizedBox(
                  width: 350,
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.redAccent[100],
                          radius: 108,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/$name.png"),
                            radius: 100,
                          ), //CircleAvatar
                        ), //CirclAvatar
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'The Blood Cell  Info. ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'information about blood cell here',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'By Falah.G.Saleih ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ),
                        SizedBox(
                          width: 120,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstRoute()),
                              );
                            }, //=> null,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app),
                                  Text('Ok'),
                                ],
                              ), //Row
                            ), //Padding
                          ), //RaisedButton
                        ) //SizedBox
                      ],
                    ), //Column
                  ), //Padding
                ), //SizedBox
              ), //Card
            ),
          );
        });
  }
}
