import 'package:dars8/screens/academic_screen.dart';
import 'package:dars8/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue[900]),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.picture_as_pdf_rounded,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Summary",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _buildSummaryItem(
                image: "assets/polivalent.png",
                title: "Polivalent",
                description:
                    "Plenty of skills around communication, media, web and advertising.",
              ),
              SizedBox(height: 20),
              _buildSummaryItem(
                image: "assets/experience.png",
                title: "Experience",
                description:
                    "More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.",
              ),
              SizedBox(height: 20),
              _buildSummaryItem(
                image: "assets/open_mind.png",
                title: "Open-minded",
                description:
                    "Always looking for the continuous improvement and ready to learn about the newest.",
              ),
              SizedBox(height: 20),
              _buildSummaryItem(
                image: "assets/smile.png",
                title: "Empathic & humble",
                description: "The user is in the center.",
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 30, // Radius oshirildi
                      backgroundColor: Colors.blue[50],
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                        size: 30, // Iconning o'lchami oshirildi
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      padding: EdgeInsets.symmetric(
                        horizontal: 40, // Gorizontal qism kengaytirildi
                        vertical: 20, // Vertikal qism kengaytirildi
                      ),
                      textStyle: TextStyle(
                        fontSize: 18, // Matn o'lchami oshirildi
                      ),
                    ),
                    child: const Text("Contact"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AcademicScreen();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 30, // Radius oshirildi
                      backgroundColor: Colors.blue[50],
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 30, // Iconning o'lchami oshirildi
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white), label: ''),
        ],
      ),
    );
  }

  Widget _buildSummaryItem({
    IconData? icon,
    String? image,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        if (image != null)
          Image.asset(
            image,
            height: 50,
            width: 50,
          )
        else if (icon != null)
          Icon(
            icon,
            size: 50,
            color: Colors.blue[900],
          ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 5),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
