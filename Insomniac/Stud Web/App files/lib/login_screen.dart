
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print('signed in ' + user.displayName);
    return user;
  }
  void _signOut(){
    print('User Signed out');
    _googleSignIn.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Container(
                height: 200.0,
                child: Image.asset('assets/iiitl.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            SizedBox(
              height: 24.0,
            ),
            RaisedButton(
                child:
                Text( 'Log In',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                color: Colors.lightBlueAccent,
                shape:  RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
                padding: EdgeInsets.all(15.0),
                onPressed:() {
                  _handleSignIn()
                      .then((FirebaseUser user)=>Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyApp())))
                      .catchError((e)=>print(e));
                }

            ),
            SizedBox(
              height: 24.0,
            ),
            RaisedButton(
                child:
                Text( 'Log Out',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                color: Colors.lightBlueAccent,
                shape:  RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
                padding: EdgeInsets.all(15.0),
                onPressed:_signOut,

            ),
          ],
        ),
      ),

    );
  }
}
