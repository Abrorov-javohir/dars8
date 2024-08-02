import 'package:dars8/screens/academic_screen.dart';
import 'package:dars8/screens/skill_screen.dart';
import 'package:dars8/screens/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  int _currentStep = 0;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Relevant Experience",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30),
              Stepper(
                physics: NeverScrollableScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) async {
                  setState(() => _currentStep = step);
                  if (step == 0 || step == 1) {
                    // Open GitHub URL when a step is tapped
                    final url = Uri.parse(
                        'https://github.com/Abrorov-javohir/imtihon_4_oy1');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      print('Could not launch $url');
                    }
                  }
                },
                steps: _buildSteps(),
                controlsBuilder: (context, _) {
                  return Container();
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AcademicScreen();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue[50],
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    child: const Text("Contact"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SkillsScreen();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue[50],
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 30,
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

  List<Step> _buildSteps() {
    return [
      _buildStep(
        title: "2024",
        role: "Puzzle Game",
        company: "RTS",
        location: "uzbekistan Tashkent",
      ),
      _buildStep(
          title: "2024",
          role: "Imtihon 4-oy",
          company: "RTS",
          location: "Tashkent"),
    ];
  }

  Step _buildStep({
    required String title,
    required String role,
    required String company,
    required String location,
  }) {
    return Step(
      title: Text(title, style: TextStyle(color: Colors.black)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(company),
          Text(location),
        ],
      ),
      isActive: true,
      state: StepState.complete,
    );
  }
}
