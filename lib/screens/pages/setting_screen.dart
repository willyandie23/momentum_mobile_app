import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool toggleSetting = false;
  String selectedOption = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background, // Background color
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "General Settings",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 3,
                child: ListTile(
                  title: const Text('Light Mode',
                      style: TextStyle(color: Colors.black)),
                  trailing: Switch(
                    value: toggleSetting,
                    onChanged: (value) {
                      setState(() {
                        toggleSetting = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 3,
                child: ListTile(
                  title: const Text('Language',
                      style: TextStyle(color: Colors.black)),
                  trailing: DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                    dropdownColor: Colors.amber,
                    items: <String>['English', 'Indonesian', 'Sunda']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: const Text('Save Settings',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
