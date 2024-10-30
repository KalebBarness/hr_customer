import 'package:flutter/material.dart';
import 'package:hp_customer/home.dart';
import 'package:hp_customer/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue.shade300,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
        selectedIndex: currentPage,
      ),
      body: ListView(children: [
        const Column(children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://preview.redd.it/some-random-black-dude-i-found-v0-7b7ipzz5af0c1.jpg?auto=webp&s=50dde31529bf146611d82a09c0e0e7cf3948a2d3"),
          ),
          Text("Jaquifues"),
        ]),
        const SizedBox(height: 45),
        const Divider(),
        const SizedBox(height: 25),
        CustomProfileButton(
          TransferPage: ProfileSettingsPage(),
          title: 'Edit Profile',
          icon: Icons.person,
          textColor: const Color.fromARGB(255, 0, 0, 0),
          iconColor: Colors.grey.shade600,
        ),
        const SizedBox(height: 10),
        CustomProfileButton(
          TransferPage: HelpAndSupportPage(),
          title: 'Help and Support',
          icon: Icons.support_agent,
          textColor: const Color.fromARGB(255, 0, 0, 0),
          iconColor: Colors.grey.shade600,
        ),
        const SizedBox(height: 10),
        const CustomProfileButton(
          TransferPage: SettingsPage(),
          title: 'App Settings',
          icon: Icons.settings,
          textColor: Color.fromARGB(255, 0, 0, 0),
          iconColor: Color.fromARGB(255, 97, 97, 98),
        ),
        const SizedBox(height: 10),
        const CustomProfileButton(
          TransferPage: LogoutPage(),
          title: 'Logout',
          icon: Icons.logout,
          textColor: Colors.red,
          iconColor: Colors.red,
        ),
      ]),
    );
  }
}

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool editting = false;

  TextEditingController faln = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController home = TextEditingController();
  TextEditingController insurance = TextEditingController();

  @override
  void dispose() {
    faln.dispose();
    phone.dispose();
    email.dispose();
    home.dispose();
    insurance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 255, 136, 0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://preview.redd.it/some-random-black-dude-i-found-v0-7b7ipzz5af0c1.jpg?auto=webp&s=50dde31529bf146611d82a09c0e0e7cf3948a2d3"),
                ),
                IconButton(
                  icon: Icon(Icons.edit,
                      color: const Color.fromARGB(255, 147, 203, 248)),
                  onPressed: () {
                    print("Edit Profile Picture");
                  },
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(),
                  iconSize: 24,
                  color: const Color.fromARGB(255, 0, 128, 255),
                  tooltip: 'Edit Profile Picture',
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Tap to edit any settings..',
                style: TextStyle(color: Colors.grey[800], fontSize: 14)),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextField(
              controller: faln,
              onChanged: (value) {
                setState(() {
                  editting = true; // Set editing to true when this field changes
                  faln.text = value; // Update the text for this specific field
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First and Last Name',
                  suffixIcon: Icon(Icons.edit,
                      color: Color.fromARGB(255, 55, 55, 55))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: phone,
              onChanged: (value) {
                setState(() {
                  editting = true; // Set editing to true when this field changes
                  phone.text = value; // Update the text for this specific field
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  suffixIcon: Icon(Icons.edit,
                      color: Color.fromARGB(255, 55, 55, 55))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: email,
              onChanged: (value) {
                setState(() {
                  editting = true; // Set editing to true when this field changes
                  email.text = value; // Update the text for this specific field
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                  suffixIcon: Icon(Icons.edit,
                      color: Color.fromARGB(255, 55, 55, 55))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: home,
              onChanged: (value) {
                setState(() {
                  editting = true; // Set editing to true when this field changes
                  home.text = value; // Update the text for this specific field
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Home Address',
                  suffixIcon: Icon(Icons.edit,
                      color: Color.fromARGB(255, 55, 55, 55))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextFormField(
              controller: insurance,
              onChanged: (value) {
                setState(() {
                  editting = true; // Set editing to true when this field changes
                  insurance.text = value; // Update the text for this specific field
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insurance Company',
                  suffixIcon: Icon(Icons.edit,
                      color: Color.fromARGB(255, 55, 55, 55))),
            ),
          ),
          const SizedBox(height: 15),
          if (editting) ...[
            Row(
              children: [
                const SizedBox(width: 55),
                ElevatedButton(
                  onPressed: () {
                    // Implement upload functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Add some spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editting = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
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
        centerTitle: true,
      ),
    );
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
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
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
