import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserPage extends StatefulWidget {
//  final FirebaseUser user;
//  Type data1;
//  UserPage(data1, {Key key}) : super(key: key);

  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<UserPage> {

  static Color deepBlue = Color(0xff466aff);
  static Color lightBlue = Color(0xff5879ff);

  static Color sendBackgroundColor = Color(0xffcfe3ff);
  static Color sendIconColor = Color(0xff3f63ff);

  static Color activitiesBackgroundColor = Color(0xfffbcfcf);
  static Color activitiesIconColor = Color(0xfff54142);

  static Color statsBackgroundColor = Color(0xffd3effe);
  static Color statsIconColor = Color(0xff3fbbfe);

  static Color paymentBackgroundColor = Color(0xffefcffe);
  static Color paymentIconColor = Color(0xffef3fff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 14),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    _buildHeader(),
                    SizedBox(height: 16),
                    _buildGradientBalanceCard(),
                    SizedBox(height: 24.0),
                    _buildCategories(),
                  ],
                ),
              ),
              SizedBox(height: 32),
              _buildTransactionList(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTransactionList() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0 * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Transaction",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.0 * 2),
                _buildTransactionItem(
                  color: Colors.deepPurpleAccent,
                  iconData: Icons.photo_size_select_actual,
                  title: "Electric Bill",
                  date: "Today",
                  amount: 11.5,
                ),
                SizedBox(height: 24),
                _buildTransactionItem(
                  color: Colors.green,
                  iconData: Icons.branding_watermark,
                  title: "Water Bill",
                  date: "Today",
                  amount: 15.8,
                ),
                SizedBox(height: 24),
                _buildTransactionItem(
                  color: Colors.orange,
                  iconData: Icons.music_video,
                  title: "Spotify",
                  date: "Yesterday",
                  amount: 05.5,
                ),
                SizedBox(height: 24),
                _buildTransactionItem(
                  color: Colors.red,
                  iconData: Icons.wifi,
                  title: "Internet",
                  date: "Yesterday",
                  amount: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildCategoryButton(
          bgColor: sendBackgroundColor,
          iconColor: sendIconColor,
          iconData: Icons.send,
          text: "Send",
        ),
        _buildCategoryButton(
          bgColor: activitiesBackgroundColor,
          iconColor: activitiesIconColor,
          iconData: Icons.work,
          text: "Activities",
        ),
        _buildCategoryButton(
          bgColor: statsBackgroundColor,
          iconColor: statsIconColor,
          iconData: Icons.trending_up,
          text: "Stats",
        ),
        _buildCategoryButton(
          bgColor: paymentBackgroundColor,
          iconColor: paymentIconColor,
          iconData: Icons.payment,
          text: "Payment",
        ),
      ],
    );
  }

  Container _buildGradientBalanceCard() {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purpleAccent.withOpacity(0.9),
            deepBlue,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$8,458.00",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Total Balance",
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello,",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Nguyen Cong Thang",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
//            image: DecorationImage(
////              image: AssetImage(),
//              colorFilter: ColorFilter.mode(
//                Colors.deepPurple[100],
//                BlendMode.darken,
//              ),
//            ),
          ),
        ),
      ],
    );
  }

  Row _buildTransactionItem(
      {Color color,
      IconData iconData,
      String date,
      String title,
      double amount}) {
    return Row(
      children: <Widget>[
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )
          ],
        ),
        Spacer(),
        Text(
          "-\$ $amount",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  OutlineButton _buildCategoryButton(
      {Color bgColor, Color iconColor, IconData iconData, String text}) {
    return OutlineButton(
      hoverColor: Colors.white,
      borderSide: BorderSide(color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
              height: 57,
              width: 57,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                iconData,
                color: iconColor,
                size: 48,
              ),
            ),
            SizedBox(height: 3),
            Text(text),
          ],
        ),


      onPressed: (){},
    );
  }

//  Column _buildCategoryCard(
//      {Color bgColor, Color iconColor, IconData iconData, String text}) {
//    return Column(
//      children: <Widget>[
//        Container(
//          height: 75,
//          width: 75,
//          decoration: BoxDecoration(
//            color: bgColor,
//            borderRadius: BorderRadius.circular(5),
//          ),
//          child: OutlineButton(
//            hoverColor: Colors.white,
//            child: Icon(
//              iconData,
//              color: iconColor,
//              size: 36,
//            ),
//            onPressed: (){},
//          ),
//        ),
//        SizedBox(height: 8),
//        Text(text),
//      ],
//    );
//  }
}
