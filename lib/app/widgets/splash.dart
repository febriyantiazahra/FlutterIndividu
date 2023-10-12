import 'package:flutter/material.dart';
import 'package:get/get.dart';

///kelas SplashScreen merupakan turunan dari StatelessWidget
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///MateralApp digunakan untuk membungkus beberapa widget yang dapat menerapkan style material design
    return MaterialApp(
      ///menghilangkan debugShowCheckedModeBanner
      debugShowCheckedModeBanner: false,
      ///Widget Scaffold ini merupakan widget utama untuk membuat sebuah halaman pada flutter
      home: Scaffold(
        ///backgroundColor digunakan untuk memberi warna pada background
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ///Widget Center digunakan untuk mengatur posisi agar tampilan berada di tengah
        body: Center(
            ///padding digunakan untuk mengatur jarak antara container dengan widget yang ada di dalamnya
            child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Widget Container ini digunakan untuk menampilkan gambar dengan lebar dan tinggi 200
              Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/assets/logo.png")),
              ///Widget SizedBox ini digunakan untuk memberi jarak antara gambar dan teks di bawahnya dengan tinggi 20
              const SizedBox(
                height: 20,
              ),
              /*Widget Text ini digunakan untuk menampilkan teks "Selamat Datang di Aplikasi Daur Ulang !" 
              dengan warna hitam dan ukuran font 20*/
              const Text(
                'Selamat Datang di Aplikasi Daur Ulang !',
                style: TextStyle(fontSize: 20, color: Colors.black),
              )
            ],
          ),
        )),
      ),
    );
  }
}
