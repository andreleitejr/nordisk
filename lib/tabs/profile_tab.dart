import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nordisk/theme/theme_colors.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:nordisk/widgets/reward_card_widget.dart';
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
        leading: const SizedBox.shrink(),
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
              // Container(
              //   padding: const EdgeInsets.all(24),
              //   decoration: BoxDecoration(
              //     color: ThemeColors.secondary,
              //     border: Border.all(color: ThemeColors.primary),
              //     borderRadius: BorderRadius.circular(24),
              //   ),
              //   child: Column(
              //     children: [
              //       // Row(
              //       //   children: [
              //       //     Icon(
              //       //       Icons.monetization_on_outlined,
              //       //       color: ThemeColors.primary,
              //       //     ),
              //       //     Text(
              //       //       'Saldo de Tourinhos:',
              //       //       style: TextStyle(
              //       //         fontWeight: FontWeight.bold,
              //       //         fontSize: 16,
              //       //       ),
              //       //     ),
              //       //     Text(
              //       //       notifier.mashScore.toString(),
              //       //       style: TextStyle(
              //       //         fontWeight: FontWeight.bold,
              //       //         fontSize: 16,
              //       //       ),
              //       //     ),
              //       //   ],
              //       // ),
              //       // const SizedBox(height: 12),
              //       // Text(
              //       //   'Troque seus Tourinhos por brindes incríveis',
              //       //   style: TextStyle(fontSize: 14),
              //       // ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 24),
              Text(
                'Cupons disponíveis',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              RewardCard(
                imageAsset: 'assets/liveup.png',
                title: 'Desconto em Marcas Saudáveis (LivUp)',
                description:
                    'Aproveite descontos exclusivos em refeições saudáveis da LivUp.',
              ),
              const SizedBox(height: 24),
              RewardCard(
                imageAsset: 'assets/spa.png',
                title: 'Desconto Buddha Spa',
                description:
                    'Relaxe e cuide-se com 10% de desconto em procedimentos selecionados no Buddha Spa.',
              ),
              const SizedBox(height: 24),
              RewardCard(
                imageAsset: 'assets/novodia.png',
                title: 'Atendimento Multidisciplinar Online (NovoDia)',
                description:
                    'Acesso a cupons para consultas gratuitas com especialistas em Educação Física, Nutrição, Psicologia e Enfermagem do Programa NovoDia.',
              ),
              const SizedBox(height: 24),
              RewardCard(
                imageAsset: 'assets/zenklub.png',
                title: 'Desconto Zenklub (NovoDia)',
                description:
                    'Descontos em sessões de psicanálise, psicologia e terapia online pelo Zenklub, via Programa NovoDia.',
              ),
              const SizedBox(height: 24),
              RewardCard(
                imageAsset: 'assets/medicamento.png',
                title: 'Desconto em Medicamentos Novo Nordisk',
                description:
                    'Cupons para preços diferenciados na compra de medicamentos Novo Nordisk participantes em farmácias credenciadas.',
              ),
              // const SizedBox(height: 24),
              // Container(
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: ThemeColors.secondary,
              //     borderRadius: BorderRadius.circular(12),
              //     border: Border.all(color: ThemeColors.primary),
              //   ),
              //   child: Text(
              //     'Acumule Tourinhos através de suas atividades e participações no programa Novo Nordisk.\n\nEscolha seu brinde desejado na lista acima e veja quantos Tourinhos você precisa para resgatá-lo.\n\nPara resgatar, clique no brinde e siga as instruções na janela pop-up (funcionalidade a ser implementada).',
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
