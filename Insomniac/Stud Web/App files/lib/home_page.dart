import 'package:flutter/material.dart';
import 'cultural.dart';
import 'extras.dart';
import 'technical.dart';
import 'package:url_launcher/url_launcher.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  _launchURL() async {
    const url = 'https://axios-iiitl.github.io/';
    if (await canLaunch(url)) {
      await launch(url,forceSafariVC: false,forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        centerTitle: true,

        title: Text('STUD  : :  WEB',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: ListView(

        padding: EdgeInsets.only(left: 30.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Our Wings',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Technical',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Cultural',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('EXTRAS',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                )
              ]),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    Technical(),
                    Cultural(),
                    Extras(),
                  ]
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        elevation: 10.0,
        backgroundColor: Colors.black,
        child: Image(image: AssetImage('assets/iiitl.png'),),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

//      bottomNavigationBar: BottomBar(),
    );
  }
}
