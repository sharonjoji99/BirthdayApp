import 'package:flutter/material.dart';

class Shroom extends StatefulWidget {
  @override
  _ShroomState createState() => _ShroomState();
}

class _ShroomState extends State<Shroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Ruks Budday'),
          centerTitle: true,
          backgroundColor: Colors.amber,
          elevation: 4,
         ),
      body:Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Row(

            children: <Widget>[

              SizedBox(width: 15,),
              Expanded(
                child: Text(
                  'Shroom Thoughts',
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
                    'Okay so my roadmap layed out for your app was thoda more complex but 25th night i had fuck ton of work legit 5 hours of some busy shit i had to do ok :( networkign shit \n  its  not an excuse but my app may fall way below your app standards but trust me most of my time went in thinking how to reset the number of clicks every `12 hours .\nI thought about cloud functions but apprently the south asia where the firestore and storage is located doeasnt support CLOUD FUNCTIONS so i cant do server fucntions like reset value so i had to come with some other way for it .\n\n Anyway i did it soo am happy and lool all the time i told you i was workign on my server ka app i was actually working on this.\n\n I also was trying to irritate you purposely by asking what you want what you want like constantly so sorry for that xd. You know its been a crazy ride till now with you , soo many new friends emily and boobo to my fammily. \n\n quarantine woulnt be possible to live through without you.',
                    maxLines: 30,

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
