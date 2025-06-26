// lib/screens/profile_tab.dart
import 'package:flutter/material.dart';
import 'package:nordisk/theme/theme_colors.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:nordisk/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<HealthDataNotifier>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TitleWidget(title: 'Programa de Trocas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Color(0xFFf5fffe)),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: ThemeColors.secondary,
                  border: Border.all(color: ThemeColors.primary),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: ThemeColors.primary,
                        ),
                        Text(
                          'Saldo de Tourinhos:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          notifier.mashScore.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Text(
                      'Troque seus Tourinhos por brindes incríveis',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Brindes Exclusivos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: ThemeColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.tcdn.com.br/img/img_prod/692716/copo_termico_stanley_com_tampa_preto_473ml_5421_1_847c8fa38e2233a153a77ba514172695_20221107155916.jpg',
                          ),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Text(
                      'Copo Stanley Novo Nordisk',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Mantenha sua bebida gelada com estilo!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFbbffe1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        '50 Tourinhos',
                        style: TextStyle(color: Color(0xFF124d34)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ThemeColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ThemeColors.primary)
                ),
                child: Text(
                  'Acumule Tourinhos através de suas atividades e participações no programa Novo Nordisk.\n\nEscolha seu brinde desejado na lista acima e veja quantos Tourinhos você precisa para resgatá-lo.\n\nPara resgatar, clique no brinde e siga as instruções na janela pop-up (funcionalidade a ser implementada).',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
