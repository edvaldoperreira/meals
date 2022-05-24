import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _settings = Settings();

  _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _createSwitch(
                'Gluten free',
                'Shows only gluten free dishes',
                _settings.isGlutenFree,
                (value) => setState(() => _settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Lactose free',
                'Shows only lactose free dishes',
                _settings.isLactoseFree,
                (value) => setState(() => _settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegan',
                'Shows only vegan dishes',
                _settings.isVegan,
                (value) => setState(() => _settings.isVegan = value),
              ),
              _createSwitch(
                'Vegetarian',
                'Shows only vegetarian dishes',
                _settings.isVegetarian,
                (value) => setState(() => _settings.isVegetarian = value),
              )
            ],
          ),
        )
      ]),
    );
  }
}
