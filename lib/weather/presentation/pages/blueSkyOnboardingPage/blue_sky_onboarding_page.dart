// ignore_for_file: use_build_context_synchronously

import 'package:blue_sky/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../shared/images_string.dart';

class BlueSkyOnboardingPage extends StatelessWidget {
  const BlueSkyOnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      controlsPadding: const EdgeInsets.only(bottom: 32),
      pages: [
        PageViewModel(
          title: 'Boas-Vindas ao Blue Sky',
          body:
              'Seu App de Previsão do Tempo! Acompanhe as condições climáticas da sua cidade.',
          image: SvgPicture.asset(
            ImagesString.weatherMainIcon,
            height: 200,
          ),
        ),
        PageViewModel(
          title: 'Descubra os Níveis de Umidade',
          body:
              'Mantenha-se informado sobre a umidade do ar e cuide melhor da sua saúde respiratória!',
          image: SvgPicture.asset(
            ImagesString.weatherHumidity,
            height: 200,
          ),
        ),
        PageViewModel(
          title: 'Previsão de Chuvas',
          body:
              'Não seja pego de surpresa! Veja a previsão de chuvas para os próximos dias.',
          image: SvgPicture.asset(
            ImagesString.weatherRain,
            height: 200,
          ),
        ),
        PageViewModel(
          title: 'Acompanhe o Vento',
          body:
              'Saiba a velocidade do vento e evite surpresas desagradáveis ao sair de casa.',
          image: SvgPicture.asset(
            ImagesString.weatherWind,
            height: 200,
          ),
        ),
        PageViewModel(
          title: 'Previsão do Tempo em Tempo Real',
          body:
              'Acompanhe a temperatura exata da sua cidade e planeje seu dia com precisão!',
          image: SvgPicture.asset(
            ImagesString.weatherTemp,
            height: 200,
          ),
        ),
      ],
      showSkipButton: true,
      skip: const Text(
        'Pular',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        size: 28.0,
      ),
      done: const Text(
        'Começar',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      onDone: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.weatherMainPage,
          (route) => false,
        );
      },
    );
  }
}
