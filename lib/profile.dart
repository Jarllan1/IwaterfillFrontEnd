import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int year = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/shiba.png'),
                    backgroundColor: Colors.pinkAccent,
                    radius: 70.0,
                  ),
                ),
                Divider(height: 55.0,
                  color: Colors.white,
                  thickness: 3.0,
                ),
                Row(
                  children: [
                    Icon(Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'NAME:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'John Rafael B. De Los Reyes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 22.0,),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'YEAR:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 22.0,),
                Row(
                  children: [
                    Icon(Icons.email_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'EMAIL:',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '21-11735@g.batstate-u.edu.ph',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      year +=1;
                    });
                  },
                  child: Text('Add Year',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightBlue[900]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
