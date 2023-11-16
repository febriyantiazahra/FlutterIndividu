///mengimpor package atau pustaka dari flutter dan getX, serta mengimpor akses file user_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';

///membuat kelas turunan statefullWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();

  void login(String email, String password) {}
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<
      FormState>(); ///global-key untuk mengakses dan memanipulasi data formulir dalam 'form' widget
  ///menyimpan nilai email dan password dari pengguna.
  String _email = 'ehzandherry@gmail.com';
  String _password = 'ehzand123';

  ///membuat object "userController" menggunakan GetX, yang digunakan untuk mengelola data pengguna, seperti proses login dan logout, serta menyimpan data pengguna
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[
              50], ///mengatur warna latar menjadi warna biru dengan kode warna 50
          ///membuat judul dengan teks "Login Page" dengan posisi ditengah, ukuran 20, dan berwarna blueGrey
          title: (const Center(
            child: Text(
              "Login Page",
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          )),
        ),
        ///mendefinisikan sebuah form dengan menggunakan _formKey yang berfungsi untuk memvalidasi input dari user ketika mereka menekan tombol "Login"
        body: Form(
            key:
                _formKey, ///membuat jarak atau ruang kosong antara widget satu dengan widget yang lainnya. dengan ukuran semua jarak (kanan, kiri, atas, bawah adalah 50.0)
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                ///membuat widget kolom (Column) dengan posisi tengah dan menambah sebuah container ayng kemudian diisi gambar dengan ukuran 200x200 piksel
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                              "images/assets/icon_register.png")), ///membuat jarak antara widget satu dengan widget yang lain dengan ukuran tinggi 50
                      const SizedBox(
                        height: 50,
                      ),
                      ///memberi teks (string) denga ukuran 20 dan memberinya warna hitam
                      const Text(
                        'Silahkan masukkan Email dan Password!',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                            20.0), ///membuat jarak antara widget satu dengan widget yang lain dengan ukuran 20 (atas, bawah, kanan, kiri)
                        ///membuat TextFormField yang bisa digunakan untuk membuat user memasukkan data teks
                        child: TextFormField(
                          ///mendekorasi TextFormField serta menentukan jenis border (garis tepi) pada input form saat tidak dalam difokuskan maupun saat difokuskan
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Email",
                          ),
                          ///menyimpan nilai yang ada pada form field dan menyimpannya dalam sebuah variable yang diberinama "_email" jika nilai tersebut tidak null
                          onSaved: (newValue) {
                            if (newValue != null) {
                              _email = newValue;
                            }
                          },
                        ),
                      ),
                      ///membuat jarak antar widget dengan ukuran tinggi 10
                      const SizedBox(
                        height: 10,
                      ),
                      ///membuat jarak antara widget satu dengan widget yang lain dengan ukuran 20 (atas, bawah, kanan, kiri)
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        ///membuat TextFormField yang bisa digunakan untuk membuat user memasukkan data teks
                        child: TextFormField(
                          ///mendekorasi TextFormField serta menentukan jenis border (garis tepi) pada input form saat tidak dalam difokuskan maupun saat difokuskan
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                          ),
                          ///menyimpan nilai yang ada pada form field dan menyimpannya dalam sebuah variable yang diberinama "_password" jika nilai tersebut tidak null
                          onSaved: (newValue) {
                            if (newValue != null) {
                              _password = newValue;
                            }
                          },
                          obscureText: true,
                        ),
                      ),
                      ///membuat jarak antara widget satu dengan widget yang lain dengan ukuran 12 (atas, bawah, kanan, kiri)
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        ///membuat tombol yang ketika ditekan dapat menyimpan dan memproses data email dan password untuk proses login
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.save();
                            userController.login(_email, _password);
                          },
                          ///menampilkan teks "Login" diatas tombol.
                          child: const Text('Login'),
                        ),
                      )
                    ]))));
  }
}
