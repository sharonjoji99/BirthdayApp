import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body:Column(
        children: <Widget>[
          SizedBox(height: 20,),
        Row(

          children: <Widget>[

            SizedBox(width: 15,),
            Expanded(
              child: Text(
              'So what the fuck is this app ??',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 30),
      ),
            ),
          ],
        ),
          SizedBox(height: 40,),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Expanded(
                  child: Text(
                    'Think of it like a Memoirs app , where you have your closest friends closest to you\n \n bored ? \n\n\njust look up one random pic of you and your friend\n\n Its not that simple too , to prevent misuse of app i have set a restriction to number of pics you can see at a time.\nInitially you will be allowed to see 2 pics of each of your friend , after completing your first pic views you can only view them again after 12 hours :) \nSo every 12 hours you can see 2 randome pics of your listed friends.\nAlso there is a human icon that you can click for some more stuff to read \n\n\ Sorry i couldnt include all your frinends ok :/     Hope you like this small project of mine and \n\nremember i always  will love you :)',

                    maxLines: 20,

                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
