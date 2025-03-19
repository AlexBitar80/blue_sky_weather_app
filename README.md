# Blue Sky - Previsão do Tempo

O **Blue Sky** é um aplicativo de previsão do tempo desenvolvido em **Flutter**, que permite visualizar as principais condições climáticas de uma determinada região.

## :partly_sunny: Funcionalidades
- Visualização da **Temperatura** em tempo real.
- Informações sobre a **Umidade** do ar.
- **Velocidade do vento**.
- **Previsão de chuvas**, quando disponível.

## :rocket: Tecnologias usadas

O aplicativo foi desenvolvido seguindo o padrão **Clean Architecture**, garantindo melhor organização e testabilidade do código.

### **Principais dependências utilizadas:**
- `equatable` - Comparação de objetos imutáveis.
- `provider` - Gerenciamento de estado.
- `flutter_svg` - Suporte para imagens SVG.
- `get_it` - Injeção de dependências.
- `introduction_screen` - Onboarding para introdução ao app.
- `weather_icons` - Ícones de condições climáticas.
- `intl` - Formatação de datas e números.
- `dio` - Consumo de APIs.
- `geolocator` - Obtenção da localização do usuário.
- `shared_preference` - Armazenamento de preferências do usuário.
- `sqflite`- Banco de dados local SQLite para armazenamento offline
- `flutter_dotenv` - Gerenciamento de variáveis de ambiente

### **Dependências de desenvolvimento:**
- `flutter_lints` - Regras de linting para boas práticas.
- `faker` - Geração de dados fictícios para testes.
- `mocktail` - Mocking para testes unitários.
- `flutter_native_splash` - Tela de splash personalizada.
- `flutter_launcher_icons` - Personalização do ícone do app.

## :man_mechanic: Como rodar a aplicação

Para rodar esta aplicação, você precisa ter instalado o **Flutter 3.16.7**, **Jdk-17**, além do **Android Studio** ou **Xcode** para rodar no emulador.

### **Passos para rodar o projeto:**
1. Clone o repositório:
```bash
  git clone https://github.com/AlexBitar80/blue_sky_weather_app.git
```

2. Entre na pasta do projeto:
```bash
  cd blue_sky_weather_app
```

3. Instale as dependências:
```bash
  flutter pub get
```

4. Rode o aplicativo:
```bash
  flutter run
```

Caso queira rodar os testes:
```bash
  flutter test
```

## 📌 **Configuração da API**
O **Blue Sky** utiliza a API do OpenWeather para obter dados meteorológicos. Para que o app funcione corretamente, você precisará configurar a chave de API.

### **Passos para configurar:**
1. Crie uma conta no [OpenWeather](https://openweathermap.org/).
2. Gere uma chave de API.
3. Crie um arquivo **.env** na raiz do projeto e adicione:
```bash
OPEN_WEATHER_API_KEY=YOUR_API_KEY_HERE
```
4. No código, altere a variável responsável pela chave da API para:
```dart
const String apiKey = dotenv.get['OPENWEATHER_API_KEY']!;
```

## :wrench: Testes
O **Blue Sky** possui testes unitários para garantir a qualidade do código. Foram implementados testes para:
- Camadas de **Data** e **Domain**.
- Validação do consumo da API com **Dio**.
- Gerenciamento de estado utilizando **Provider**.

## Considerações e Melhorias Futuras
Durante o desenvolvimento do Blue Sky, algumas funcionalidades e melhorias não puderam ser implementadas devido a limitações de tempo. No entanto, elas representam excelentes oportunidades para aprimorar ainda mais o aplicativo:

#### Testes de UI e E2E:

Criar testes de interface de usuário (UI) e testes de ponta a ponta (E2E) para garantir a qualidade e a estabilidade da experiência do usuário em diferentes cenários e dispositivos.

#### Melhorias na Interface do Usuário (UI):

Realizar melhorias na interface do usuário para torná-la ainda mais intuitiva e agradável. Isso pode incluir aprimoramentos no layout, na animação, na paleta de cores e na usabilidade geral do aplicativo.

## :pushpin: Licença
Este projeto está sob a licença MIT [LICENSE](https://github.com/AlexBitar80/blue_sky_weather_app/blob/master/LICENSE) para mais detalhes.

