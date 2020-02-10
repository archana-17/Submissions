import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ExtrasDetail extends StatelessWidget {
  final assetPath , wingname, image,url;
  ExtrasDetail({this.assetPath, this.wingname,this.image,this.url});
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

      ),

      body: ListView(
          children: [
            SizedBox(height: 15.0),
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
                child:Image.asset(image),
              ),
            ),
            FlatButton(
              child: Center(
                child: Text(''),
              ),
              onPressed:_launchURL1,
            )
          ]
      ),


    );
  }
}
