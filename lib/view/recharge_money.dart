import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RechargeMoney extends StatefulWidget {
  @override
  _rechargeMoney createState() => _rechargeMoney();
}
class _rechargeMoney extends State<RechargeMoney>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 14),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Flexible(child: new TextField(
                    decoration: const InputDecoration(helperText: "Enter Money Number"),
                    style: Theme.of(context).textTheme.body1,
                  )),
                ],
              ),
              RaisedButton(
                child: const Text('Nap tien', style: TextStyle(fontSize: 20),),
                onPressed: (){},

              ),
            ],
          ),
        ),
      ),

    );
  }

}