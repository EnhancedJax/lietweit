import 'package:flutter/material.dart';
import 'package:LeitWeit/widgets/button_icon.dart';
import 'package:LeitWeit/widgets/list_routine.dart';
import 'package:LeitWeit/pages/auth/login.dart';
import 'package:go_router/go_router.dart';
import 'package:LeitWeit/services/supabase.dart';
import 'package:LeitWeit/themedata.dart';

class HomePage extends StatelessWidget {
  static const route = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Hi User, ready for another workout?',
                      style: Theme.of(context).textTheme.headlineLarge,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const ButtonIcon(Icons.stacked_line_chart_rounded),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.secondarySurface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('M'),
                    Text('T'),
                    Text('W'),
                    Text('T'),
                    Text('F'),
                    Text('S'),
                    Text('S'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Your Workouts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              ListRoutine(),
              ElevatedButton(
                onPressed: () {
                  supabase.auth.signOut();
                  context.go(LoginPage.route);
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
