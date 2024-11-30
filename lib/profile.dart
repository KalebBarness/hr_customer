import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hp_customer/featured.dart';
import 'package:hp_customer/home.dart';
import 'package:hp_customer/claims.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 4;
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile',
                style: TextStyle(fontWeight: FontWeight.w400)),
            centerTitle: true,
          ),
          bottomNavigationBar: NavigationBar(
            indicatorColor: const Color.fromARGB(255, 0, 174, 255),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.wallet), label: 'Billing'),
              NavigationDestination(
                  icon: Icon(Icons.add_box_rounded), label: 'Claims'),
              NavigationDestination(
                  icon: Icon(Icons.star_rate_outlined), label: 'Featured'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                currentPage = index;
              });

              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  break;

                case 1:
                  break;

                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ClaimsPage()),
                  );
                  break;

                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeaturedPage()),
                  );
                  break;

                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                  break;
              }
            },
            selectedIndex: currentPage,
          ),
          body: ListView(children: [
            const SizedBox(height: 20),
            Column(children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25), // Shadow color
                        blurRadius: 25, // Shadow blur radius
                        offset: const Offset(0, 4), // Shadow offset
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://preview.redd.it/some-random-black-dude-i-found-v0-7b7ipzz5af0c1.jpg?auto=webp&s=50dde31529bf146611d82a09c0e0e7cf3948a2d3",
                    ),
                  ),
                ),
              ),
              const Text("Jaquifues"),
            ]),
            const SizedBox(height: 25),
            const Divider(),
            const SizedBox(height: 25),
            CustomProfileButton(
              TransferPage: const ProfileSettingsPage(),
              title: 'My Account',
              icon: Icons.person,
              textColor: const Color.fromARGB(255, 0, 0, 0),
              iconColor: Colors.grey.shade600,
            ),
            CustomProfileButton(
              TransferPage: const NotificationsPage(),
              title: 'Notifications',
              icon: Icons.notifications,
              textColor: const Color.fromARGB(255, 0, 0, 0),
              iconColor: Colors.grey.shade600,
            ),
            CustomProfileButton(
              TransferPage: const ProfileSettingsPage(),
              title: 'Privacy and Security',
              icon: Icons.lock,
              textColor: const Color.fromARGB(255, 0, 0, 0),
              iconColor: Colors.grey.shade600,
            ),
            CustomProfileButton(
              TransferPage: const HelpAndSupportPage(),
              title: 'Help and Support',
              icon: Icons.support_agent,
              textColor: const Color.fromARGB(255, 0, 0, 0),
              iconColor: Colors.grey.shade600,
            ),
            const CustomProfileButton(
              TransferPage: AppSettingsPage(),
              title: 'About',
              icon: Icons.help,
              textColor: Color.fromARGB(255, 0, 0, 0),
              iconColor: Color.fromARGB(255, 97, 97, 98),
            ),
            const CustomProfileButton(
              TransferPage: LogoutPage(),
              title: 'Logout',
              icon: Icons.logout,
              textColor: Colors.red,
              iconColor: Colors.red,
            ),
          ]),
        ));
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool isFeatureUpdatesEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Divider(),
          const SizedBox(height: 10),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Notification Settings',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ))),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Customize the types of push notifications'))),
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('you want to receive'))),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Enable All Notifications',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(), // Ensures space between text and the slider button
              Padding(
                padding: const EdgeInsets.only(
                    right: 10), // Adjust right padding as needed
                child: Switch(
                  value: true, // Initial state of the slider (on or off)
                  onChanged: (bool newValue) {
                    ('Slider state: $newValue');
                  },
                  activeColor: const Color.fromARGB(
                      255, 0, 153, 255), // Color of the slider when active
                  inactiveThumbColor:
                      Colors.grey, // Color of the slider thumb when inactive
                  inactiveTrackColor:
                      Colors.grey.withOpacity(0.5), // Track color when inactive
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Feature and App updates',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(), // Ensures space between text and the slider button
              Padding(
                padding: const EdgeInsets.only(
                    right: 10), // Adjust right padding as needed
                child: Switch(
                  value: true, // Initial state of the slider (on or off)
                  onChanged: (bool newValue) {
                    ('Slider state: $newValue');
                  },
                  activeColor: const Color.fromARGB(
                      255, 0, 153, 255), // Color of the slider when active
                  inactiveThumbColor:
                      Colors.grey, // Color of the slider thumb when inactive
                  inactiveTrackColor:
                      Colors.grey.withOpacity(0.5), // Track color when inactive
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Emergency Services',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(), // Ensures space between text and the slider button
              Padding(
                padding: const EdgeInsets.only(
                    right: 10), // Adjust right padding as needed
                child: Switch(
                  value: true, // Initial state of the slider (on or off)
                  onChanged: (bool newValue) {
                    ('Slider state: $newValue');
                  },
                  activeColor: const Color.fromARGB(
                      255, 0, 153, 255), // Color of the slider when active
                  inactiveThumbColor:
                      Colors.grey, // Color of the slider thumb when inactive
                  inactiveTrackColor:
                      Colors.grey.withOpacity(0.5), // Track color when inactive
                ),
              ),
            ],
          ),const SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Agent Support',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(), // Ensures space between text and the slider button
              Padding(
                padding: const EdgeInsets.only(
                    right: 10), // Adjust right padding as needed
                child: Switch(
                  value: true, // Initial state of the slider (on or off)
                  onChanged: (bool newValue) {
                    ('Slider state: $newValue');
                  },
                  activeColor: const Color.fromARGB(
                      255, 0, 153, 255), // Color of the slider when active
                  inactiveThumbColor:
                      Colors.grey, // Color of the slider thumb when inactive
                  inactiveTrackColor:
                      Colors.grey.withOpacity(0.5), // Track color when inactive
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Incoming Reports',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(), // Ensures space between text and the slider button
              Padding(
                padding: const EdgeInsets.only(
                    right: 10), // Adjust right padding as needed
                child: Switch(
                  value: true, // Initial state of the slider (on or off)
                  onChanged: (bool newValue) {
                    ('Slider state: $newValue');
                  },
                  activeColor: const Color.fromARGB(
                      255, 0, 153, 255), // Color of the slider when active
                  inactiveThumbColor:
                      Colors.grey, // Color of the slider thumb when inactive
                  inactiveTrackColor:
                      Colors.grey.withOpacity(0.5), // Track color when inactive
                ),
              ),
            ],
          ),
          const Divider()

        ]));
  }
}

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool editting = false;
  TextEditingController username = TextEditingController();
  TextEditingController faln = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController home = TextEditingController();
  TextEditingController insurance = TextEditingController();

  String savedUsername = '';
  String savedFaln = '';
  String savedPhone = '';
  String savedEmail = '';
  String savedPassword = '';
  String savedHome = '';
  String savedInsurance = '';

  void saveProfile() {
    setState(() {
      savedUsername = username.text;
      savedFaln = faln.text;
      savedPhone = phone.text;
      savedEmail = email.text;
      savedPassword = password.text;
      savedHome = home.text;
      savedInsurance = insurance.text;
    });
  }

  @override
  void initState() {
    super.initState();
    username.text = savedUsername;
    faln.text = savedFaln;
    phone.text = savedPhone;
    email.text = savedEmail;
    password.text = savedPassword;
    home.text = savedHome;
    insurance.text = savedInsurance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('', style: TextStyle(color: Colors.white)),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(),
              const SizedBox(height: 10),
              const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Edit Profile',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500))),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.25), // Shadow color
                              blurRadius: 25, // Shadow blur radius
                              offset: const Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: const NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          ),
                          backgroundColor: Colors.transparent,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 255, 255, 255), // Border color
                                width: 3.0, // Border width
                              ),
                            ),
                            child: Align(
                              alignment: Alignment
                                  .bottomRight, // Position the icon inside the avatar
                              child: Container(
                                width: 45,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 0, 174,
                                      255), // Icon button background color
                                  border: Border.all(
                                    width: 3,
                                    color: Colors
                                        .white, // Border for the icon button
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {}, // Button action
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors
                                        .transparent, // Transparent background for the button
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white, // Icon color
                                    size: 20, // Icon size
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextField(
                  controller: faln,
                  onChanged: (value) {
                    setState(() {
                      editting = true;
                      faln.text = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextField(
                  controller: email,
                  onChanged: (value) {
                    setState(() {
                      editting = true;
                      email.text = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextField(
                  controller: password,
                  onChanged: (value) {
                    setState(() {
                      editting = true;
                      password.text = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromARGB(255, 55, 55, 55),
                    ),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextField(
                  controller: home,
                  onChanged: (value) {
                    setState(() {
                      editting = true;
                      home.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Home Address',
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 195, 195, 195),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: TextField(
                  controller: insurance,
                  onChanged: (value) {
                    setState(() {
                      editting = true;
                      insurance.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Insurance Company',
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 195, 195, 195),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              if (editting) ...[
                Center(
                    child: Row(children: [
                  const SizedBox(width: 25, height: 125),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(175, 40),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 10),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton(
                      onPressed: () {
                        saveProfile; // add Shared Preferences
                        setState(() {
                          editting = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(175, 40),
                        backgroundColor: const Color.fromARGB(255, 0, 174, 255),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 10),
                      ),
                      child: const Text('SAVE',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )))
                ]))
              ]
            ]));
  }
}

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
        centerTitle: true,
      ),
    );
  }
}

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Settings'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            children: [],
          ),
        ));
  }
}

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
        centerTitle: true,
      ),
    );
  }
}

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.TransferPage,
    required this.title,
    required this.icon,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.arrowIcon = Icons.arrow_forward_ios,
  });

  final Widget TransferPage;
  final String title;
  final IconData icon, arrowIcon;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          minimumSize: const Size(200, 60),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransferPage));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
            Icon(arrowIcon, color: iconColor),
          ],
        ),
      ),
    );
  }
}
