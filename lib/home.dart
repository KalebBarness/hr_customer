import 'package:flutter/material.dart';
import 'package:hp_customer/billing.dart';
import 'package:hp_customer/claims.dart';
import 'package:hp_customer/featured.dart';
import 'package:hp_customer/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = '';
  String userName = '';
  String icon = '';
  int currentPage = (0);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _updateMessage();
  }

  void _updateMessage() {
    final currentTime = DateTime.now();
    int hour = currentTime.hour;

    setState(() {
      if (hour >= 0 && hour < 12) {
        message = 'Good Morning';
      } else if (hour >= 12 && hour < 17) {
        message = 'Good Afternoon';
      } else if (hour >= 17 && hour < 23) {
        message = 'Good Evening';
      }
    });
  }

  void _onHelpButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help'),
        content:
            const Text('I think this should navigate to a FAQ page instead'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: (250),
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0), // Optional, adjust as needed
          child: Align(
            alignment: Alignment
                .centerLeft, // Ensures text stays on the left horizontally
            child: Text(
              'ClaimReady+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 136, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: _onHelpButtonPressed,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 136, 0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '\$message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      icon,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Last Login: 11/13/2024 11:40 AM CST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(8)),
                const Text(
                  'View Home Policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const _ViewPolicyPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    'View Policy',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const _EmergencyPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(125, 150),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.grey.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 0, 0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.warning,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(
                      height: 35,
                      child: Text(
                        'Emergency',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const _ContactAgentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(125, 150),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.grey.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 187, 255),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.contact_phone_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Agent',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const _ViewReportsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(125, 150),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.grey.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 5, 167, 45),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.align_horizontal_left_sharp,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'View',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Report',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 25),
            ),
            Text('Next Steps',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
          ]),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(8)),
                const Icon(Icons
                    .account_circle_outlined), // Replace this with a 4/6 steps progress wheel
                const Padding(padding: EdgeInsets.all(8)),
                const Text(
                  'Discover ClaimReady+',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DiscoverPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 28,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BillingPage()),
              );
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
                MaterialPageRoute(builder: (context) => const FeaturedPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
          }
        },
        selectedIndex: currentPage = 0,
      ),
    );
  }
}

class _ViewPolicyPage extends StatelessWidget {
  const _ViewPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Insurance Policy')),
      body: const Center(
        child: Text('Page'),
      ),
    );
  }
}

class _EmergencyPage extends StatelessWidget {
  const _EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Page')),
      body: const Center(
        child: Text('Welcome to the Emergency Page'),
      ),
    );
  }
}

class _ContactAgentPage extends StatelessWidget {
  const _ContactAgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Agent')),
      body: const Center(
        child: Text('Page'),
      ),
    );
  }
}

class _ViewReportsPage extends StatelessWidget {
  const _ViewReportsPage({super.key});

  void _launchURL() async {
    const url =
        'https://docs.google.com/document/d/13WtswiyUYOJXtyRQKcC5xJU0QlsRDPKtM-J-pHM2n4Q/edit#heading=h.67npy1ucyyzo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reports'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: _launchURL,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 75),
                foregroundColor: Colors.black,
              ),
              child: const Text('Report From "MM/DD/YYYY"'),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 16.0), // Optional, adjust as needed
            child: Align(
              alignment: Alignment
                  .centerLeft, // Ensures text stays on the left horizontally
              child: Text(
                'Discover ClaimReady+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 136, 0),
        ),
        body: const Center(
          child: Column(
            children: [
              Text('What ClaimReady+ has to Offer!'),
            ],
          ),
        ));
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Service Providers')),
    body: const Center(
      child: Text('Here are the service providers.'),
    ),
  );
}

class ServiceProviderCard extends StatelessWidget {
  final String url;
  final String imageUrl;
  final String label;

  const ServiceProviderCard({
    required this.url,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 125.0,
          height: 125.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.zero,
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              Text(label),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
