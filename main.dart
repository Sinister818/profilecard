import 'package:flutter/material.dart';
import 'package:my_app/projects_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 72, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profile.jpeg"),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Anuj Patel",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rutgers University",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 72, 255),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "Hi my name is Anuj Patel and I am double majoring in Finance and Computer Science. In my free time I enjoy playing the guitar and watching tv shows. My favorite nfl team is the Packers and my favorite tv show is How I Met Your Mother. I also really enjoy going on long drives with my friends. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(),
                Column(
                  children: [
                    Icon(Icons.school, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "Rutgers",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.location_on, size: 28),
                    SizedBox(height: 4),
                    Text(
                      "New Jersey",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildSocialButton(
                    Icons.code, "GitHub", "https://github.com/sinister818"),
                _buildSocialButton(Icons.work_history_outlined, "LinkedIn",
                    "https://www.linkedin.com/in/anujpatel1311")
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectScreen(
                          projects: [
                            {
                              "title": "Movie App",
                              "description":
                                  "Created an app which displayed current, and upcoming movies.",
                              "isPinned": false,
                            },
                            {
                              "title": "NBA Stat Cruncher",
                              "description":
                                  "Created a data analysis algorithm to figure out the top 15 players of all time using certain stats",
                              "isPinned": false,
                            },
                            {
                              "title": "Portfolio",
                              "description":
                                  "Created a webpage which highlights my experiences and a way to showcase all my projects",
                              "isPinned": false,
                            }
                          ],
                        ),
                      ));
                },
                child: const Text("Projects"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String labelText, String url) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(labelText),
      onPressed: () {
        launchUrl(Uri.parse(url));
      },
    );
  }
}
