import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:raksbirthday/home/hallo_button.dart';
import 'package:raksbirthday/home/hallo_button2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int firstTime = 1;

  var backupURL;
  var url;
  List<String> LatestUrl = List<String>();
  List<String> names = ['ashwin','food','harshita','isha','ruuks','sharon','shashu'];
  List<int> clicksList = List<int>();
  List<String> urls =List<String>();
  List<DateTime> futureTimes = List<DateTime>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('photos').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Try again with internet');
          } else {
            final friends = snapshot.data.documents;

            urls.clear();
            LatestUrl.clear();
            clicksList.clear();
            futureTimes.clear();


            for (var friend in friends) {

              print("sjsjs ${friend['clicks']}");

              clicksList.add(friend['clicks']);
              urls.add(friend['url']);
              print('what is order : ${friend['clicks']}');
              futureTimes.add(friend['timeNext'].toDate());



            }
            print(urls.length);
            for (int i=0;i<urls.length;i++){

              if (DateTime.now().isAfter(futureTimes[i])){

                Firestore.instance
                    .collection('photos')
                    .document('${names[i]}')
                    .updateData({'clicks': 2});

              }



            }



            return Scaffold(
              appBar: AppBar(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.person),
                        onPressed: () { Navigator.pushNamed(context, '/shroom'); },

                      );
                    },
                  ),
                  title: Text('Ruks Budday'),
                  centerTitle: true,
                  backgroundColor: Colors.amber,
                  elevation: 4,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.help),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tutorial');
                      },
                    )
                  ]),
              body: Column(
                children: <Widget>[
                  Container(
                    width: 400,
                    height: 400,
                    child: url != null
                        ? Image.network(
                            url,
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          )
                        : Text('no image'),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                       clicksList[5]> 0
                          ? HalloButton2(
                         color1: Color.fromRGBO(255, 126, 126, 1),
                         color2: Color.fromRGBO(60, 232, 211, 1),
                              text: 'Sharon : ${clicksList[5]}',
                              onPressedBtn: () async {

                                   DateTime sharonNow;
                                   DateTime sharonFuture;
                                if(clicksList[5]==2){
                                  sharonNow = DateTime.now();
                                  sharonFuture=sharonNow.add(new Duration(hours: 12));

                                  await Firestore.instance
                                      .collection('photos')
                                      .document('${names[5]}')
                                      .updateData({'timeNext': sharonFuture});






                                }


                                   clicksList[5] = clicksList[5] - 1;
                                await Firestore.instance
                                    .collection('photos')
                                    .document('${names[5]}')
                                    .updateData({'clicks': clicksList[5]});
                                Random random = new Random();
                                int randomNumber = random.nextInt(70);
                                var temp = await getURL(randomNumber, '${names[5]}');
                                await Firestore.instance
                                    .collection('photos')
                                    .document('${names[5]}')
                                    .updateData({'url': temp});
                                setState(() {
                                  url = temp;
                                  urls[5]=temp;
                                  firstTime = 0;
                                  clicksList[5] = clicksList[5] + 1 - 1;
                                });
                              },
                            )
                          : HalloButton2(
                              color1:Color.fromRGBO(255, 126, 126, 1),
                              color2: Color.fromRGBO(60, 232, 211, 1),
                              text: 'Sharon : 0',
                              onPressedBtn: () async {

                                setState(() {
                                  url = urls[5];

                                });
                              },
                            )

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      clicksList[0]> 0
                          ? HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Ashwin : ${clicksList[0]}',
                        onPressedBtn: () async {

                          DateTime sharonNow;
                          DateTime sharonFuture;
                          if(clicksList[0]==2){
                            sharonNow = DateTime.now();
                            sharonFuture=sharonNow.add(new Duration(hours: 12));

                            await Firestore.instance
                                .collection('photos')
                                .document('${names[0]}')
                                .updateData({'timeNext': sharonFuture});






                          }


                          clicksList[0] = clicksList[0] - 1;
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[0]}')
                              .updateData({'clicks': clicksList[0]});
                          Random random = new Random();
                          int randomNumber = random.nextInt(19);
                          var temp = await getURL(randomNumber, '${names[0]}');
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[0]}')
                              .updateData({'url': temp});
                          setState(() {
                            url = temp;
                            urls[0]=temp;
                            firstTime = 0;
                            clicksList[0] = clicksList[0] + 1 - 1;
                          });
                        },
                      )
                          : HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Sharon : 0',
                        onPressedBtn: () async {

                          setState(() {
                            url = urls[0];

                          });
                        },
                      )

                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      clicksList[3]> 0
                          ? HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Isha : ${clicksList[3]}',
                        onPressedBtn: () async {

                          DateTime sharonNow;
                          DateTime sharonFuture;
                          if(clicksList[3]==2){
                            sharonNow = DateTime.now();
                            sharonFuture=sharonNow.add(new Duration(hours: 12));

                            await Firestore.instance
                                .collection('photos')
                                .document('${names[3]}')
                                .updateData({'timeNext': sharonFuture});

                            print('NOWWWW: $sharonNow');
                            print('FUTUREEE: $sharonFuture');


                          }


                          clicksList[3] = clicksList[3] - 1;
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[3]}')
                              .updateData({'clicks': clicksList[3] });
                          Random random = new Random();
                          int randomNumber = random.nextInt(20);
                          var temp = await getURL(randomNumber, '${names[3]}');
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[3]}')
                              .updateData({'url': temp});
                          setState(() {
                            url = temp;
                            urls[3]=temp;
                            firstTime = 0;
                            clicksList[3] = clicksList[3] + 1 - 1;
                          });
                        },
                      )
                          : HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Isha : 0',
                        onPressedBtn: () async {

                          setState(() {
                            url = urls[3];

                          });
                        },
                      ),
                      SizedBox(width: 15,),
                      clicksList[2]> 0
                          ? HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Harshita : ${clicksList[2]}',
                        onPressedBtn: () async {

                          DateTime sharonNow;
                          DateTime sharonFuture;
                          if(clicksList[2]==2){
                            sharonNow = DateTime.now();
                            sharonFuture=sharonNow.add(new Duration(hours: 12));

                            await Firestore.instance
                                .collection('photos')
                                .document('${names[2]}')
                                .updateData({'timeNext': sharonFuture});






                          }


                          clicksList[2] = clicksList[2] - 1;
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[1]}')
                              .updateData({'clicks': clicksList[2]});
                          Random random = new Random();
                          int randomNumber = random.nextInt(16);
                          var temp = await getURL(randomNumber, '${names[2]}');
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[2]}')
                              .updateData({'url': temp});
                          setState(() {
                            url = temp;
                            urls[2]=temp;
                            firstTime = 0;
                            clicksList[2] = clicksList[2] + 1 - 1;
                          });
                        },
                      )
                          : HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Harshita : 0',
                        onPressedBtn: () async {

                          setState(() {
                            url = urls[2];

                          });
                        },
                      ),
                      SizedBox(width: 15,),
                      clicksList[6]> 0
                          ? HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Shashu : ${clicksList[6]}',
                        onPressedBtn: () async {

                          DateTime sharonNow;
                          DateTime sharonFuture;
                          if(clicksList[6]==2){
                            sharonNow = DateTime.now();
                            sharonFuture=sharonNow.add(new Duration(hours: 12));

                            await Firestore.instance
                                .collection('photos')
                                .document('${names[6]}')
                                .updateData({'timeNext': sharonFuture});






                          }


                          clicksList[6] = clicksList[6] - 1;
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[6]}')
                              .updateData({'clicks': clicksList[6]});
                          Random random = new Random();
                          int randomNumber = random.nextInt(12);
                          var temp = await getURL(randomNumber, '${names[6]}');
                          await Firestore.instance
                              .collection('photos')
                              .document('${names[6]}')
                              .updateData({'url': temp});
                          setState(() {
                            url = temp;
                            urls[6]=temp;
                            firstTime = 0;
                            clicksList[6] = clicksList[6] + 1 - 1;
                          });
                        },
                      )
                          : HalloButton(
                        color1: Color.fromRGBO(115, 130, 255, 1),
                        color2: Color.fromRGBO(0, 172, 183, 0.2),
                        text: 'Shashu : 0',
                        onPressedBtn: () async {

                          setState(() {
                            url = urls[6];

                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                    clicksList[4]> 0
                        ? HalloButton(
                      color1: Color.fromRGBO(115, 130, 255, 1),
                      color2: Color.fromRGBO(0, 172, 183, 0.2),
                      text: 'Ruuks : ${clicksList[4]}',
                      onPressedBtn: () async {

                        DateTime sharonNow;
                        DateTime sharonFuture;
                        if(clicksList[4]==2){
                          sharonNow = DateTime.now();
                          sharonFuture=sharonNow.add(new Duration(hours: 12));

                          await Firestore.instance
                              .collection('photos')
                              .document('${names[4]}')
                              .updateData({'timeNext': sharonFuture});



                        }


                        clicksList[4] = clicksList[4] - 1;
                        await Firestore.instance
                            .collection('photos')
                            .document('${names[4]}')
                            .updateData({'clicks': clicksList[4]});
                        Random random = new Random();
                        int randomNumber = random.nextInt(55);
                        var temp = await getURL(randomNumber, '${names[4]}');
                        await Firestore.instance
                            .collection('photos')
                            .document('${names[4]}')
                            .updateData({'url': temp});
                        setState(() {
                          url = temp;
                          urls[4]=temp;
                          firstTime = 0;
                          clicksList[4] = clicksList[4] + 1 - 1;
                        });
                      },
                    )
                        : HalloButton(
                      color1: Color.fromRGBO(115, 130, 255, 1),
                      color2: Color.fromRGBO(0, 172, 183, 0.2),
                      text: 'Ruuks : 0',
                      onPressedBtn: () async {

                        setState(() {
                          url = urls[4];

                        });
                      },
                    ),
                      SizedBox(width: 15,),
                    clicksList[1]> 0
                        ? HalloButton(
                      color1: Color.fromRGBO(115, 130, 255, 1),
                      color2: Color.fromRGBO(0, 172, 183, 0.2),
                      text: 'Foood : ${clicksList[1]}',
                      onPressedBtn: () async {

                        DateTime sharonNow;
                        DateTime sharonFuture;
                        if(clicksList[1]==2){
                          sharonNow = DateTime.now();
                          sharonFuture=sharonNow.add(new Duration(hours: 12));

                          await Firestore.instance
                              .collection('photos')
                              .document('${names[1]}')
                              .updateData({'timeNext': sharonFuture});



                        }


                        clicksList[1] = clicksList[1] - 1;
                        await Firestore.instance
                            .collection('photos')
                            .document('${names[1]}')
                            .updateData({'clicks': clicksList[1]});
                        Random random = new Random();
                        int randomNumber = random.nextInt(30);
                        var temp = await getURL(randomNumber, '${names[1]}');
                        await Firestore.instance
                            .collection('photos')
                            .document('${names[1]}')
                            .updateData({'url': temp});
                        setState(() {
                          url = temp;
                          urls[1]=temp;
                          firstTime = 0;
                          clicksList[1] = clicksList[1] + 1 - 1;
                        });
                      },
                    )
                        : HalloButton(
                      color1: Color.fromRGBO(115, 130, 255, 1),
                      color2: Color.fromRGBO(0, 172, 183, 0.2),
                      text: 'Foood : 0',
                      onPressedBtn: () async {

                        setState(() {
                          url = urls[1];

                        });
                      },
                    )



                  ],)
                ],
              ),
            );
          }
        });
  }
}

Future<String> getURL(int num, String name) async {
  String uploadedFileURL;

  print('Getting url');
  StorageReference storageReference =
      FirebaseStorage.instance.ref().child('$name/$name$num.jpg');
  await storageReference.getDownloadURL().then((fileURL) {
    uploadedFileURL = fileURL;
    print("File url : $uploadedFileURL");
  });
  return uploadedFileURL;
// no need of the file extension, the name will do fine.
}
