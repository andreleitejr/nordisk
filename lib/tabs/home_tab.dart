import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nordisk/theme/theme_colors.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:nordisk/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  final User user;

  const HomeTab({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<HealthDataNotifier>();

    return Scaffold(
      backgroundColor: Color(0xFFf5fffe),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Color(0xFFf5fffe)),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.abc_outlined, color: Colors.red, size: 36),
              //     SizedBox(width: 12),
              //     Text(
              //       "O Seu Mashscore",
              //       style: TextStyle(
              //         fontSize: 28,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.indigo,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
              // Text(
              //   "ID do Utilizador: ${user.uid}",
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(color: Colors.grey, fontSize: 12),
              // ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ThemeColors.secondary, ThemeColors.primary],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      Text('Bem-vindo,'),
                      TitleWidget(title: 'John Doe'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Mashscore",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            notifier.mashScore.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Nível Atual",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            notifier.level.toString(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.card_giftcard),
                        Text(
                          'Você aprendeu mais sobre o Mash!',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Resgate seu cupom para ter uma vida mais saudável',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Resgate seu cupom',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/image.jpg'),
                  fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
