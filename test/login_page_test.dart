import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/app/ui/login_pade.dart';

void main() {
  group('LoginController Tests', () {
    test('Successful login redirects to HomeView', () async {
      // Arrange
      LoginPage loginController = const LoginPage();
      String email = 'ehzandherry@gmail.com';
      String password = 'ehzand123';

      // Act
      loginController.login(email, password);

      // Assert
    });

    test('Invalid email shows snackbar with correct message', () async {
      // Arrange
      LoginPage loginController = const LoginPage();
      String email = 'invalidemail';
      String password = 'ehzand123';

      // Act
      loginController.login(email, password);

      // Assert
     
    });

    test('Invalid password shows snackbar with correct message', () async {
      // Arrange
      LoginPage loginController = const LoginPage();
      String email = 'ehzandherry@gmail.com';
      String password = 'invalidpassword';

      // Act
      loginController.login(email, password);

      // Assert
    });

    test('Nonexistent email shows snackbar with correct message', () async {
      // Arrange
      LoginPage loginController = const LoginPage();
      String email = 'nonexistent@example.com';
      String password = 'ehzand123';

      // Act
      loginController.login(email, password);

      // Assert
    });

    // Add more tests for other scenarios as needed.
  });
}