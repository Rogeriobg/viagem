import 'package:flutter/material.dart';

void main() => runApp(const ExploreMundoApp());

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Explore Mundo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _destinos = [
    {
      'title': 'Praia Camburiú',
      'image': 'assets/images/praiaCamburiu.jpg',
      'detail':
          'As praias de Balneário Camboriú são um dos principais atrativos que levam todos os verões milhares de turistas para o litoral de Santa Catarina. E, muito embora seja a mais famosa, a Praia Central, que é o point da cidade, famosa pelos altíssimos prédios que se enfileiram por toda a sua extensão, não é a única.'
    },
    {
      'title': 'Praia Grande',
      'image': 'assets/images/destination2.jpeg',
      'detail':
          'Praia Grande tem nada menos que 22 km de praias, e cada trecho de areia é acompanhado por uma orla bem-estruturada. Além disso, a diversidade de atrações é surpreendente, desde trilhas desafiadoras para os amantes da natureza até opções ideais para famílias com crianças.'
    },
    {
      'title': 'Santa Catarina',
      'image': 'assets/images/destination3.jpg',
      'detail':
          'Santa Catarina tem mais de 400 km de litoral e muitas praias, que oferecem uma variedade de experiências'
    },
    {
      'title': 'Bahia',
      'image': 'assets/images/praiaCamburiu2.jpg',
      'detail':
          'O litoral baiano é o maior do Brasil Assim, é possível curtir mar, sol e areia em um dos pontos mais bonitos do país. A Bahia é sinônimo de tranquilidade, belas combinações de ondas se quebrando na areia, calmaria e ótima hospitalidade. Por isso, confira as melhores praias para aproveitar tudo o que o destino oferece.'
    },
  ];

  List<Map<String, String>> _filteredDestinos = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _filteredDestinos = _destinos;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _filterDestinos(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDestinos = _destinos;
      } else {
        _filteredDestinos = _destinos
            .where((destino) =>
                destino['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Destinos'),
            Tab(text: 'Pacotes de Viagem'),
            Tab(text: 'Contato'),
            Tab(text: 'Sobre Nós'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDestinosTab(),
          _buildPacotesTab(),
          _buildContatoTab(),
          _buildSobreNosTab(),
        ],
      ),
    );
  }

  Widget _buildDestinosTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchField(),
          _buildDestinationSection(),
        ],
      ),
    );
  }

  Widget _buildPacotesTab() {
    return _buildPackageSection();
  }

  Widget _buildContatoTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Contato',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Email: contato@exploremundo.com',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10),
          Text(
            'Telefone: (11) 99999-9999',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10),
          Text(
            'Cidade: São Paulo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10),
          Text(
            'Caixa Postal: 12345-678',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildSobreNosTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Sobre Nós',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Bem-vindo à Explore Mundo, sua agência de viagens de confiança! Nossa missão é proporcionar experiências inesquecíveis e personalizadas para todos os nossos clientes.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              'Com anos de experiência no mercado, oferecemos uma ampla gama de serviços, incluindo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              '✈️ Planejamento de viagens\n'
              '🏨 Reservas de hotéis\n'
              '🚗 Aluguel de veículos\n'
              '🌍 Passeios guiados\n'
              '📅 Consultoria de viagem personalizada',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Text(
              'Nosso objetivo é garantir que cada viagem seja perfeita, adaptando-se às suas necessidades e preferências. Junte-se a nós e descubra o mundo com a Explore Mundo!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          labelText: 'Pesquisar destinos',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (query) {
          _filterDestinos(query);
        },
      ),
    );
  }

  Widget _buildDestinationSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Destinos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Toque na imagem para ver detalhes',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _filteredDestinos.map((destino) {
              return Column(
                children: [
                  _buildDestinationCard(
                      destino['title']!, destino['image']!, destino['detail']!),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String title, String imagePath, String detail) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDetailScreen(
              title: title,
              imagePath: imagePath,
              detail: detail,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pacotes de Viagem',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPackageCard('Pacote Can Cun', 'assets/images/package1.jpg'),
              _buildPackageCard(
                  'Pacote Costa Rica', 'assets/images/package2.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class DestinationDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String detail;
  const DestinationDetailScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              detail,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
