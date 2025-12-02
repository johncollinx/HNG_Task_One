import 'package:flutter/material.dart';

// 1. HomePage is now StatelessWidget, accepting theme state and callback.
class HomePage extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> toggleTheme;

  const HomePage({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold background will automatically use the theme's color.
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
        // Use a fixed color (teal) for contrast.
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
                // 2. Use the callback to change theme in the parent widget.
                onChanged: toggleTheme, 
              ),
              const Icon(Icons.dark_mode, color: Colors.white70),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),

      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Photo (AssetImage color is not affected by theme)
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/cover.jpg"),
                ),
              ),

              SizedBox(height: 20),

              // About Me
              SectionCard(
                title: "About Me",
                child: Text(
                  "Hi, I’m Collins Ehimhen Amiohu — a tech-driven professional from Abuja, Nigeria... "
                  "I have a background in web development, sales, marketing, and admin, and I’m currently "
                  "pursuing a B.Sc. in Computer Science.",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 20),

              // Skills
              SectionCard(
                title: "Soft Skills",
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SkillChip("Teamwork"),
                    SkillChip("Leadership"),
                    SkillChip("Problem Solving"),
                    SkillChip("Time Management"),
                    SkillChip("Communication"),
                  ],
                ),
              ),

              SizedBox(height: 30),

              RoundedButton(Icons.download, "Download CV"),
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton(Icons.code, "GitHub"),
                  RoundedButton(Icons.business_center, "LinkedIn"),
                ],
              ),

              SizedBox(height: 15),
              RoundedButton(Icons.email, "Email"),

              SizedBox(height: 40),

              // Projects
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Projects",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 16),

              ProjectCard(
                title: "Ctranslate Mobile App",
                desc: "An offline-centric translation app for low-resource languages.",
              ),
              SizedBox(height: 20),

              ProjectCard(
                title: "ToDo App",
                desc: "A productivity app to manage daily tasks with Firebase backend.",
              ),

              SizedBox(height: 30),

              // Contact
              SectionCard(
                title: "Contact Me",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

//
// ---------- THEME-AWARE COMPONENTS ----------
// (Refactored from functions to classes where necessary)
//

// 3. SectionCard is now a StatelessWidget to access context properly.
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = Theme.of(context).colorScheme.surface; // Use theme surface color

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? color : Colors.white, // Keep white in light mode for contrast
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12,
              blurRadius: 6,
              spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

// 4. SkillChip is updated to use theme colors.
class SkillChip extends StatelessWidget {
  final String text;
  const SkillChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Choose appropriate background and text colors for both modes
    final bgColor = isDark ? Colors.deepPurple.shade900 : Colors.deepPurple.shade50;
    final textColor = isDark ? Colors.white70 : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: TextStyle(fontSize: 14, color: textColor)),
    );
  }
}

// 5. RoundedButton is updated to use theme colors.
class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  
  const RoundedButton(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Use theme colors for better dark mode experience
    final color = isDark ? Colors.deepPurple.shade200 : Colors.deepPurple;
    final bgColor = isDark ? Colors.deepPurple.shade900 : Colors.deepPurple.shade100;

    return InkWell(
      onTap: () {
        // Implement navigation logic here later
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(width: 10),
            Text(label,
                style: TextStyle(fontSize: 16, color: color)),
          ],
        ),
      ),
    );
  }
}

// 6. ProjectCard is updated to use theme colors.
class ProjectCard extends StatelessWidget {
  final String title;
  final String desc;

  const ProjectCard({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? Colors.deepPurple.shade900 : Colors.deepPurple.shade50;
    final iconColor = isDark ? Colors.white : Colors.black;
    final titleColor = isDark ? Colors.white : Colors.black;
    final descColor = isDark ? Colors.grey[400] : Colors.black54;


    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.work_outline, size: 30, color: iconColor),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.w600, 
                        color: titleColor)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(fontSize: 14, color: descColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
