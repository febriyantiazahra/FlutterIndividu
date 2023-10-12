///mengimport package atau pustaka yang diperlukan
import 'package:flutter/material.dart'; ///berisi widget dan classes untuk membangu antarmuka
import 'package:firedart/auth/firebase_auth.dart'; ///berisi implementasi authentikasi firebase menggunakan firedart
import 'package:hive_flutter/hive_flutter.dart'; ///berisi implementasi flutter untuk database berorientasi objek dari Hive
import 'package:get/get.dart'; ///membantu penegmbangan aplikasi flutter yang lebih cepat dan efisien
import 'package:final_project_2023/app/data/token_adaptor.dart'; ///berisi adaptor untuk menyimpan dan memuat token authentikasi firebase

///mengimpor beberapa modul dalam aplikasi, file splash.dart, hive_store.dart,
import 'app/widgets/splash.dart';
import 'app/data/hive_store.dart';
import 'app/ui/home_page.dart';
import 'app/ui/login_pade.dart';

///mengkoneksikan project ini dengan database (firestore)
const apiKey = "AIzaSyAH2KTK6U5cPSh922OiK3VWEYp7rW1AZwg";
const projectId = "coba-ac022";

///membuat main page(halaman yang pertama kali muncul saat aplikasi dijalankan)
void main() async {
  ///memastikan bahwa sebuah bagian penting dari flutter sudah siap sebelum menjalankan kode. agar dapat mencegah munculnya kesalahan
  WidgetsFlutterBinding.ensureInitialized();

  ///menginiasi dan mendaftarkan adapter di dalam database key-value bernama Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());

  ///menginisiasi Firebase Authentication dan mengkonfirmasi penggunaan HiveStore sebagai penyimpanan cache untuk FirebaseAuth
  FirebaseAuth.initialize(apiKey, await HiveStore.create());

  ///menjalankan aplikasi dengan widget utama MyApp
  runApp(const MyApp());
}

///membuat kelas turunan StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*mengembalikan widget FutureBuilder() yang digunakan untuk menampilkan SplashScreen() selama 3 detik
  saat aplikasi sedang memuat "connectionState". setelah waktu tersebut berlalu, maka akan muncul widget LoginPage*/
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            /*menentukan nama dan halaman utama aplikasi setelah SplashScreen() selesai.
            pada aplikasi ini, halaman utama aplikasi ditentukan oleh LoginPage() */
            return GetMaterialApp(
              debugShowCheckedModeBanner:
                  false, ///parameter yang digunakan untuk menonaktifkan tampilan label "debug" pada aplikasi
              title:
                  'Flutte Demo', ///memberi judul pada aplikasi yang akan dibuat
              theme: ThemeData(
                  primarySwatch: Colors
                      .blueGrey), ///menentukan warna tema berwarna blueGrey
              home: const LoginPage(),
            );
          }
        });
  }
}
