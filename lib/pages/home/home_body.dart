import 'package:deon_greenmed/constants.dart';
import 'package:deon_greenmed/database/database_helper.dart';
import 'package:deon_greenmed/models/user.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBody extends StatefulWidget {

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, _password;

  void _launchUrl(String Url) async{
    if (await canLaunch(Url)) {
      await launch(Url);
    }
    else{
      throw 'could not open url';
    }
  }


  void _launchCaller(int number) async {
    var url = "tel: ${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      throw 'Could not place call';
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: EdgeInsets.fromLTRB(32.0, 66.0, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32
                    ),
                  ),
                ),
              ),
              SizedBox(height: 54,),

              ClipRect(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 90,
                    width: 350,
                    child: RaisedButton(
                      highlightColor: Colors.teal,
                      color: Colors.grey[300],

                      onPressed: () {

                        Navigator.of(context).pushNamed("/selectDoc");

                      },

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                            child: SvgPicture.asset('assets/svg/stethoscope.svg'),
                          ),
                          Text(
                            'Visit a doctor',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              ClipRect(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 90,
                    width: 350,
                    child: RaisedButton(
                      highlightColor: Colors.teal,
                      onPressed: () {
                        setState(() {
                          _showDialogue();
//
                        });
                      },
                      color: Colors.grey[300],

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                            child: SvgPicture.asset('assets/svg/notepad.svg'),
                          ),
                          Text(
                            'Prescription',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              ClipRect(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 90,
                    width: 350,
                    child: RaisedButton(
                      highlightColor: Colors.teal,
                      onPressed: () {
                        setState(() {
                          _launchUrl("https://www.google.com/maps/place/Adeyemo+Alakija+St,+Ikeja+GRA,+Lagos/@6.5785962,3.3501541,17z/data=!3m1!4b1!4m5!3m4!1s0x103b920e2a8cfa0f:0x4f4ade203850afa5!8m2!3d6.5785962!4d3.3523428");
                        });

                      },
                      color: Colors.grey[300],

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                            child: SvgPicture.asset('assets/svg/compasss.svg'),
                          ),
                          Text(
                            'Directions',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              ClipRect(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 90,
                    width: 350,
                    child: RaisedButton(
                      highlightColor: Colors.teal,
                      onPressed: () {

                          Navigator.of(context).pushNamed("/covidScreen");

                      },
                      color: Colors.grey[300],

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                            child: SvgPicture.asset('assets/svg/call.svg'),
                          ),
                          Text(
                            'Covid 19',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              ClipRect(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 90,
                    width: 350,
                    child: RaisedButton(
                      highlightColor: Colors.teal,
                      onPressed: () {
                        setState(() {
                          _launchCaller(emergencyPhoneNo);

                        });

                      },
                      color: Colors.grey[300],

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                            child: SvgPicture.asset('assets/svg/ambulance.svg'),
                          ),
                          Text(
                            'Emergency',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              ClipRect(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 90,
                    width: 350,
                    child: RaisedButton(
                      highlightColor: Colors.teal,
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Dismiss alert dialog

                      },
                      color: Colors.deepOrange[200],

                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 26.0, 24.0, 24.0 ),
                            child: SvgPicture.asset('assets/svg/caution.svg'),
                          ),
                          Text(
                            'Discharged',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25,),


            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _getName(){
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var user = new User(_name, _username, _password, null);
        var db = new DatabaseHelper();
        db.selectUser(user);
        _isLoading = false;

        return;
      });
    }
  }

  void _showDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Coming Soon',
            style: TextStyle(
            color: Colors.teal,
          ),),
          content: Text('We are working on this feature at the moment, please bear with us.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Continue',
                  style:
              TextStyle(
                color: Colors.teal,
              )),
              onPressed: () {
                Navigator.of(dialogContext)
                    .pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

}
