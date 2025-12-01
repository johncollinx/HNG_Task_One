import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(title: Text("Projects")),
            ListTile(title: Text("Skills")),
            ListTile(title: Text("Contact")),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "My Portfolio",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.wb_sunny, color: Colors.white70),
              Switch(
                value: isDark,
                onChanged: (val) {
                  setState(() => isDark = val);
                },
              ),
              const Icon(Icons.dark_mode, color: Colors.white70),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Photo
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: const AssetImage("assets/images/cover.jpg"),
                ),
              ),

              const SizedBox(height: 20),

              // About Me
              sectionCard(
                title: "About Me",
                child: const Text(
                  "Hi, I’m Collins Ehimhen Amiohu — a tech-driven professional from Abuja, Nigeria... "
                  "I have a background in web development, sales, marketing, and admin, and I’m currently "
                  "pursuing a B.Sc. in Computer Science.",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              // Skills
              sectionCard(
                title: "Soft Skills",
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    SkillChip("Teamwork"),
                    SkillChip("Leadership"),
                    SkillChip("Problem Solving"),
                    SkillChip("Time Management"),
                    SkillChip("Communication"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              roundedButton(Icons.download, "Download CV"),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundedButton(Icons.code, "GitHub"),
                  roundedButton(Icons.business_center, "LinkedIn"),
                ],
              ),

              const SizedBox(height: 15),
              roundedButton(Icons.email, "Email"),

              const SizedBox(height: 40),

              // Projects
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Projects",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),

              projectCard(
                title: "Ctranslate Mobile App",
                desc: "An offline-centric translation app for low-resource languages.",
              ),
              const SizedBox(height: 20),

              projectCard(
                title: "ToDo App",
                desc: "A productivity app to manage daily tasks with Firebase backend.",
              ),

              const SizedBox(height: 30),

              // Contact
              sectionCard(
                title: "Contact Me",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("johncollinsbran@gmail.com"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("+234-09011906128"),
                    ),
                    ListTile(
                      leading: Icon(Icons.link),
                      title: Text("www.Climel.inc"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

//
// ---------- COMPONENTS ----------
//

Widget sectionCard({required String title, required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        child,
      ],
    ),
  );
}

class SkillChip extends StatelessWidget {
  final String text;
  const SkillChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}

Widget roundedButton(IconData icon, String label) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text(label,
              style: const TextStyle(fontSize: 16, color: Colors.deepPurple)),
        ],
      ),
    ),
  );
}

Widget projectCard({required String title, required String desc}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.deepPurple.shade50,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        const Icon(Icons.work_outline, size: 30),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(fontSize: 14)),
            ],
          ),
        )
      ],
    ),
  );
}
