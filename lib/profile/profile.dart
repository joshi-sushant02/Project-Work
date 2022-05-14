import 'package:firebase1/profile/profilewidget.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                color: Colors.white,
                child: Center(
                  child: Container(
                      child: const Center(
                          child: Text(
                    'PROFILE',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildUserInfoDisplay('user1name', 'Name'),
                          buildUserInfoDisplay('Admin', 'Position'),
                          buildUserInfoDisplay('user1@gmail.com', 'Email'),
                          SizedBox(
                            height: 80,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'LOGOUT',
                              style: TextStyle(fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              top: 120.0,
              child: Stack(children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              color: Colors.black,
                              offset: new Offset(2.0, 2.0),
                              blurRadius: 8.0,
                            )
                          ],
                          shape: CircleBorder(),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/user1.jpg')
                              // image: AssetImage('assets/user3.png')

                              )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      Icons.photo_camera,
                      size: 36,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
