import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:io';


class FirstRoute extends StatefulWidget {

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent, //(0xff8ffFFF),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.white, Colors.redAccent[100]])),
          ),

          title: new Text(
            'Detection Of Normal Blood Cells',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),

          actions: <Widget>[
            IconButton(
              icon: new Image.asset('icons/exit.png'),
              tooltip: 'Exit',
              onPressed: () {
                exit(0);
              },
            ),
            IconButton(
              icon: new Image.asset('icons/help.png'),
              tooltip: 'info',
              onPressed: () {
                _showResultHelp('About App. ');
              },
            ), //IconButton
            IconButton(
              icon: new Image.asset('icons/gratitude.png'),
              tooltip: 'thanks',
              onPressed: () {
                _showThanks('Special Thanks ');
              },
            ),
          ],
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          toolbarHeight: 40,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10.00,
          // backgroundColor: Colors.greenAccent[400],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.redAccent[100],
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: ElevatedButton(
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage("images/blood_cells.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(1.0),
                    spreadRadius: 25,
                    blurRadius: 20,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ),
      ),
    );
  }

  //
  void _showResultHelp(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              text,
            ),
            content: Scrollbar(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 50,
                shadowColor: Colors.redAccent[100],
                color: Colors.grey[100],
                child: SizedBox(
                  width: 450,
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), //or 15.0
                          child: Container(
                            height: 120.0,
                            width: 120.0,
                            child: Image.asset("images/front.png"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'Detection of Normal Blood Cells',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),

                        ), //Text
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'the applivation for the detection of normal blood cells for 8 groups of normal human blood cells .by using machine learning technology in the field of artificial intelligence . using the Neural networks algorithms and Tensorflow framework API .  must using clear blood cells images  to get best detetcion and accurecy.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),

                        ), //SizedBox
                        Text(
                          'The dataset contains a total of 17,092 images of individual normal',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          //Textstyle
                        ),
                        Text(
                          'cells which were acquired using the analyzer CellaVision DM96 in the Core Laboratory  at the Hospital Clinic of Barcelona',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          
                        ),
                        
                        SizedBox(
                          height: 5,
                        ), 
                        
                        SizedBox(
                          height: 5,
                        ), 
                        Text(
                          'By Falah.G.Saleih',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ), 
                        ),
                        Text(
                          'AI Freelance Developer ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
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
                            color: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app),
                                  Text('Ok'),
                                ],
                              ), 
                            ), 
                          ), 
                        ) 
                      ],
                    ), 
                  ), 
                ),
              ), 

             
            ),
           
          );
        });
  }

  // special thaks

  void _showThanks(String text) {
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
                shadowColor: Colors.redAccent[100],
                color: Colors.grey[100],
                child: SizedBox(
                  width: 450,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          
                            ),
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'Special thanks for doctors of at the Hospital Clinic of Barcelona for help me to get huge dataset \n',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          
                        ), //Text
                        SizedBox(
                          height: 8,
                        ), //SizedBox
                        Text(
                          'Cite this dataset \n',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          //Textstyle
                        ),
                        Text(
                          'Acevedo, Andrea; Merino, Anna; Alferez, Santiago; Molina, Ángel; Boldú, Laura; Rodellar, José (2020), “A dataset for microscopic peripheral blood cell images for development  of automatic recognition systems”, Mendeley Data, V1, doi: 10.17632/snkd93bnjr.1',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          //Textstyle
                        ),

                        //Text
                        SizedBox(
                          height: 5,
                        ), //SizedBox
                        Text(
                          '\n ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ), //Textstyle
                        ),
                        SizedBox(
                          height: 5,
                        ), //SizedBox
                        Text(
                          'By Falah.G.Saleih',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ), //Textstyle
                        ),
                        Text(
                          'AI Freelance Developer ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
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
                            color: Colors.blueGrey,
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
