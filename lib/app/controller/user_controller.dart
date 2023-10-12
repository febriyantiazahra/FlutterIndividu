import 'package:firedart/firedart.dart';
import 'package:get/get.dart';
import 'package:final_project_2023/app/ui/home_page.dart';
import 'package:final_project_2023/app/ui/login_pade.dart';

class UserController extends GetxController {
  ///method login digunakan user untuk masuk ke dalam aplikasi dengan email dan
  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signIn(email, password);
      var user = await FirebaseAuth.instance.getUser();
      Get.offAll(() => HomePage());

      ///jika berhasil login, user akan diarahkan ke tampilan home page
    } catch (e) {
      ///apabila email yang dimasukkan salah, akan muncul tulisan "Login Error" dan pesan "Format email tidak sesuai" dengan durasi dua detik
      if (e.toString() == "AuthException: INVALID_EMAIL") {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "Format email tidak sesuai",
          duration: Duration(seconds: 2),
        ));

        ///apabila password yang dimasukkan salah, akan muncul tulisan "Login Error" dan pesan "Password salah" dengan durasi dua detik
      } else if (e.toString() == "AuthException: INVALID_PASSWORD") {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "Password salah",
          duration: Duration(seconds: 2),
        ));

        ///apabila email yang dimasukkan tidak ditemukan, akan muncul tulisan "Login Error" dan pesan "User belum terdaftar" dengan durasi dua detik
      } else if (e.toString() == "AuthException: EMAIL_NOT_FOUND") {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "User belum terdaftar",
          duration: Duration(seconds: 2),
        ));

        ///apabila terdapat kesalahan lain saat login, akan muncul tulisan "Login Error" dan pesan "Unknow Error" dengan durasi dua detik
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "Unknow Error",
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  ///Method logout digunakan user untuk keluar dari aplikasi. Setelah menekan tombol logout, user akan diarahkan ke halaman login
  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginPage());
  }
}
