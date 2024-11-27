import 'package:auto_route/auto_route.dart';
import 'package:chapweb/presenter/widgets/app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Text('data'),
    );
  }

  _buildAppBar() {
    return const MainAppBar();
  }
}
