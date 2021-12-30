import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class UrlLauncher extends StatefulWidget {
  const UrlLauncher({Key? key}) : super(key: key);

  @override
  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  static const url='https://www.prothomalo.com/';
  static const facbookurl='https://www.facebook.com/';
  static const ajkerdealurl='https://ajkerdeal.com/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: (){
                    launch(url);
                  },
                  child: Text('Prothom alo '),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: (){
                    launch(facbookurl);
                  },
                  child: Text('Facebook '),

                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: (){
                    launch(ajkerdealurl);
                  },
                  child: Text('Ajker Deal '),
                ),  SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: (){
                    launch(ajkerdealurl);
                  },
                  child: Text('Ajker Deal '),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: (){
                    launch("tel:1738717829");
                  },
                  child: Text('Call '),
                ),
              ],
            )
        ),
      ),
    );
  }
}
