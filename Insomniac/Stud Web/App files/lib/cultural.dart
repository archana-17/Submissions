import 'package:flutter/material.dart';
import 'cultural_detail.dart';
class Cultural extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width-30.0,
              height: MediaQuery.of(context).size.height-50.0 ,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('E-Cell', 'assets/ecell.png',
                      'Entrepreneurship is the act of creating a business or businesses while building and scaling it to generate a profit.Like initiating social change, creating an innovative product or presenting a new life-changing solution.',
                      'https://chat.whatsapp.com/CSWC2GIaC3g7rsdL96wNKg',
                      context),
                  _buildCard('After Dark', 'assets/photo.png',
                      'Fine art photography is first and foremost about the artist. It is not about capturing what the camera sees; it is about capturing what the artist sees. ',
                      'https://chat.whatsapp.com/K2SnId3KAYP0vBxrLK1jNL',
                      context),
                  _buildCard('Oorza', 'assets/sports.jpeg',
                      'There are plenty of talented people in the world. As you already know, talent is not enough. Some of the athletes with the most potential never pan out. What separates the good from the great is determination and work ethic.',
                      'https://chat.whatsapp.com/Fkc2LD1XGFBBWaQk9cDbIZ',
                      context),
                  _buildCard('Other', 'assets/dance.jpg',
                      'The dance is over, the applause subsided, but the joy and feeling will stay with you forever. – W.M. Tory',
                      'https://chat.whatsapp.com/Fkc2LD1XGFBBWaQk9cDbIZ',
                      context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath,String info,String urlll, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CulturalDetail(
                assetPath: imgPath,
                wingname: name,
                information:info,
                url: urlll,
              )));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                )),
            Hero(
                tag: imgPath,
                child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath),
                            fit: BoxFit.contain)))),
            SizedBox(height: 35.0),
            Text(name,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 14.0)),

          ],),),),);
  }
}
