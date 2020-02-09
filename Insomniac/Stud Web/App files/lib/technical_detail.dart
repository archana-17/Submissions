import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnicalDetail extends StatelessWidget {
  final assetPath , wingname,information,url;

  TechnicalDetail({this.assetPath, this.wingname,this.information,this.url});
  _launchURL1() async {
    String urll = url;
    if (await canLaunch(urll)) {
      await launch(urll, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $urll';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Chat Area',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),

      ),

      body: ListView(
          children: [
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  'Axios',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 15.0),
            Hero(
                tag: assetPath,
                child: Image.asset(assetPath,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 20.0),

            SizedBox(height: 10.0),
            Center(
              child: Text(wingname,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(information,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: FlatButton(
                      child: Center(
                          child: Text('Join the Chat',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          )
                      ),
                      onPressed:_launchURL1,
                    )
                )
            )

          ]
      ),

    );
  }
}
