import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Lets Get Started!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    fontSize: 26.0,
                    color: Colors.black87,
                    height:3.0,

                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      maxLength: 60,
                      decoration: InputDecoration(
                        label: Text('Name'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your name';
                        }
                        if(value.length < 2){
                          return 'Name Should be atleast 3 letters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        name = value!;
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 60,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your password';
                        }
                        if(value.length < 8){
                          return 'Password must be 8 or more characters';
                        }
                        if(value.length >20){
                          return 'Password must be 20 characters long only';
                        }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(height: 10.0,),
                    ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          print (name);
                          print (email);
                          print (password);
                        }
                      },
                      child: Text('Create Account',
                        style: TextStyle(
                          letterSpacing: 1.0,

                        ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                      ),
                    ),

                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(
                          color: Colors.black,
                          height: 50,
                        ),),
                        SizedBox(width: 5.0,),
                        Text("or", style: TextStyle(color: Colors.amber),),
                        SizedBox(width: 5.0,),
                        Expanded(child: Divider(
                          color: Colors.black,
                          height: 50,
                        ))
                      ],
                    ),

                    SizedBox(height: 15.0), // Adding space between the Facebook and Google buttons
                    // Google Sign-In Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Placeholder for Google Sign-In
                        print('Sign in with Google button pressed');
                      },
                      icon: Icon(Icons.login), // Icon for Google Sign-In
                      label: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 15.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Placeholder for Facebook Sign-In
                        print('Sign in with Facebook button pressed');
                      },
                      icon: Icon(Icons.facebook), // Icon for Facebook Sign-In
                      label: Text(
                        'Sign in with Facebook',
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),


                    SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Login Here',
                            style: TextStyle(
                              color: Colors.amber,
                              decoration: TextDecoration.underline,
                              fontSize:15.0,
                            ),
                          ),
                          onTap: ()=> Navigator.popAndPushNamed(context, '/login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
