import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kullanimi1/bloc/cart_bloc.dart';
import 'package:flutter_bloc_kullanimi1/bloc/fontsize_bloc.dart';
import 'package:flutter_bloc_kullanimi1/bloc/theme_bloc.dart';
import 'package:flutter_bloc_kullanimi1/helpers/shared_fontsize.dart';
import 'package:flutter_bloc_kullanimi1/style/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/shared_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? isThemeLight;
  double? isFontSize;
  await ThemeShared().createThemeSharedPrefObj();
  await FontSizeShared().createFontSizeSharedPrefObj();
  isThemeLight = await ThemeShared().loadThemeSharedPref();
  isFontSize = await FontSizeShared().loadFontSizeSharedPref();

  List bosListe = [];

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(
            CartState(bosListe),
          ),
        ),
        BlocProvider<FontSizeBloc>(
          create: (BuildContext context) => FontSizeBloc(
            FontSizeState(isFontSize ?? 17),
          ),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(
            ThemeState(isThemeLight ?? true),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SharedPreferences.getInstance();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.isLight ? ThemeData.light() : ThemeData.dark(),
          home: const HomePageScreen(),
        );
      },
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List urunler = [
    "Acer Mouse",
    "HP Laptop",
    "Razer Mouse",
    "Razer Klavye",
    "Macbook",
    "Asus Laptop"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: simpleText(context, "Anasayfa"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPageScreen(),
              ),
            ),
            icon: BlocBuilder<CartBloc, CartState>(
              bloc: BlocProvider.of<CartBloc>(context),
              builder: (context, CartState state) {
                return Badge(
                  position: BadgePosition.bottomEnd(),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    " ${state.eklenenUrunler.length}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPageScreen(),
              ),
            ),
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: urunler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              child: ListTile(
                title: simpleText(context, urunler[index]),
                trailing: IconButton(
                  onPressed: () => BlocProvider.of<CartBloc>(context)
                      .urunEkle(urunler[index]),
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({Key? key}) : super(key: key);

  @override
  _CartPageScreenState createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: simpleText(context, "Sepet"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (context, CartState state) {
          return state.eklenenUrunler.isNotEmpty
              ? ListView.builder(
                  itemCount: state.eklenenUrunler.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(
                            state.eklenenUrunler[index],
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "Liste Boş",
                  ),
                );
        },
      ),
    );
  }
}

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({Key? key}) : super(key: key);

  @override
  _SettingsPageScreenState createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  double currentSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: simpleText(context, "Ayarlar"),
      ),
      body: Center(
        child: Column(
          children: [
            /* ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).changeTheme(
                    Theme.of(context).brightness == Brightness.light
                        ? false
                        : true);
              },
              child: simpleText(context, "Temayı Değiştir"),
            ),*/
            BlocBuilder<ThemeBloc, ThemeState>(
              bloc: BlocProvider.of<ThemeBloc>(context),
              builder: (context, ThemeState state) {
                return SwitchListTile(
                  title: state.isLight
                      ? const Text("Tema: Açık")
                      : const Text("Tema: Kapalı"),
                  onChanged: (val) {
                    // ignore: avoid_print
                    print("val: $val");
                    BlocProvider.of<ThemeBloc>(context).changeTheme(val);
                  },
                  value: state.isLight,
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<FontSizeBloc, FontSizeState>(
              bloc: BlocProvider.of<FontSizeBloc>(context),
              builder: (context, FontSizeState state) {
                return simpleText(
                    context, "Font Size: " + state.fontSize.toString());
              },
            ),
            BlocBuilder<FontSizeBloc, FontSizeState>(
              bloc: BlocProvider.of<FontSizeBloc>(context),
              builder: (context, FontSizeState state) {
                return Slider(
                  value: state.fontSize,
                  min: 10,
                  max: 30,
                  divisions: 5,
                  label: state.fontSize.round().toString(),
                  onChanged: (double value) {
                    BlocProvider.of<FontSizeBloc>(context)
                        .changeFontSize(value);
                  },
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}


/*


 */