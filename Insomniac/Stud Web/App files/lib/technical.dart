import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'technical_detail.dart';

class Technical extends StatelessWidget {
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
                  _buildCard('Competitive Coding','assets/cc.jpg','If you\'ve ever thought about competitive coding, all you\'ve got to do is start now. Doesn\'t matter which class or branch you are in. Everyone can code and everyone can be competitive. Basically, all you\'ve got to have is the right mindset and the right skill set.','https://chat.whatsapp.com/BDGXKe6N8D8FWH6RBE7434',context),
                  _buildCard('Web Devlopment', 'assets/webd.png','For many professional coders, demand and salary are only part of the equation. The chance to meet and overcome new challenges on a daily basis, to conceptualize and introduce personalized artistic solutions, makes for a fresh and exciting career choice that never gets dull.','https://chat.whatsapp.com/LM4WHwyw5DFLcPp9TlRxXp',context),
                  _buildCard('App Development','assets/appd.png','With the exploding popularity of smartphones and tablets, mobile application development is becoming a more and more popular medium of software creation. The creation of mobile applications draws much of its roots from traditional software development. The end result, however, is software intended to utilize the unique features and hardware of mobile devices.','https://chat.whatsapp.com/HIZuNNrOIh0DtZIlprhxad', context),
                  _buildCard('Machine Learning','assets/ml.png','Machine learning is the concept that a computer program can learn and adapt to new data without human interference. Machine learning is a field of artificial intelligence (AI) that keeps a computer’s built-in algorithms current regardless of changes in the worldwide economy.','https://chat.whatsapp.com/Fkc2LD1XGFBBWaQk9cDbIZ',context),
                  _buildCard('Cyber Security','assets/Cybersecurity.png','Cyber security refers to the body of technologies, processes, and practices designed to protect networks, devices, programs, and data from attack, damage, or unauthorized access. Cyber security may also be referred to as information technology security.','https://chat.whatsapp.com/Fkc2LD1XGFBBWaQk9cDbIZ',context),
                  _buildCard('Artificial Intelligence','assets/ai.jpg','Artificial intelligence (AI) is wide-ranging branch of computer science concerned with building smart machines capable of performing tasks that typically require human intelligence. AI is an interdisciplinary science with multiple approaches, but advancements in machine learning and deep learning are creating a paradigm shift in virtually every sector of the tech industry. ','https://chat.whatsapp.com/Fkc2LD1XGFBBWaQk9cDbIZ',context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, String info,String urlll,context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TechnicalDetail(
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
