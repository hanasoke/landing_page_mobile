import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Pengelolaan Kosan Hanagakure'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SEARCH BAR
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Kamar Kos',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // FILTER BUTTON
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                  label: Text('Filter'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // LIST KOS
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
                children: [
                  kosImageCard(
                    context: context,
                    imagePath: 'assets/kosan/room_1.jpg',
                    nama: 'Kamar Konohagakure',
                    lokasi: 'Lantai 1',
                    harga: 'Rp 800.000 / bulan',
                  ),
                  kosImageCard(
                    context: context,
                    imagePath: 'assets/kosan/room_2.jpg',
                    nama: 'Kamar Iwagakure',
                    lokasi: 'Lantai 2',
                    harga: 'Rp 1.200.000 / bulan',
                  ),
                  kosImageCard(
                    context: context,
                    imagePath: 'assets/kosan/room_3.jpg',
                    nama: 'Kamar Sunagakure',
                    lokasi: 'Lantai 1',
                    harga: 'Rp 900.000 / bulan',
                  ),
                  kosImageCard(
                    context: context,
                    imagePath: 'assets/kosan/room_4.jpg',
                    nama: 'Kamar Kirigakure',
                    lokasi: 'Lantai 2',
                    harga: 'Rp 1.100.000 / bulan',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget kosImageCard({
  required BuildContext context,
  required String imagePath,
  required String nama,
  required String lokasi,
  required String harga,
}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailKamarPage(
            imagePath: imagePath,
            nama: nama,
            lokasi: lokasi,
            harga: harga,
          ),
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(lokasi, style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  harga,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class DetailKamarPage extends StatelessWidget {
  final String imagePath;
  final String nama;
  final String lokasi;
  final String harga;

  const DetailKamarPage({
    super.key,
    required this.imagePath,
    required this.nama,
    required this.lokasi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GAMBAR UTAMA
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'fasilitas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  // ICON FASILITAS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      fasilitasIcon('assets/icons/bedroom.png', 'Bedroom'),
                      fasilitasIcon('assets/icons/bathroom.png', 'Bathroom'),
                      fasilitasIcon('assets/icons/kitchen.png', 'Kitchen'),
                    ],
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Pesan Kamar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fasilitasIcon(String iconPath, String label) {
    return Column(
      children: [
        Image.asset(iconPath, width: 40, height: 40),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
