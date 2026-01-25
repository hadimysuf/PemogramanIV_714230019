import 'package:flutter/material.dart';
import 'package:dio_contact/model/login_model.dart';
import 'package:dio_contact/services/api_services.dart';
import 'package:dio_contact/services/auth_manager.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final ApiServices _dataService = ApiServices();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    bool isLoggedIn = await AuthManager.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _username,
                validator: (v) =>
                    v != null && v.length >= 4 ? null : 'Min 4 karakter',
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: _password,
                obscureText: true,
                validator: (v) =>
                    v != null && v.length >= 3 ? null : 'Min 3 karakter',
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginProcess,

                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginProcess() async {
  final isValidForm = _formKey.currentState!.validate();

  if (isValidForm) {
    final postModel = LoginInput(
      username: _username.text,
      password: _password.text,
    );

    LoginResponse? res = await _dataService.login(postModel);

    if (res != null && res.status == 200) {
      await AuthManager.login(
        _username.text,
        res.token ?? '',
      );

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res?.message ?? 'Login gagal')),
      );
    }
  }
}

}
