import 'package:designify/designify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designify Example',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Designify Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'أزرار مخصصة',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // زر أساسي
            CustomButton.primary(
              text: 'زر أساسي',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم النقر على الزر الأساسي')),
                );
              },
            ),
            const SizedBox(height: 16),
            // زر ثانوي
            CustomButton.secondary(
              text: 'زر ثانوي',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم النقر على الزر الثانوي')),
                );
              },
            ),
            const SizedBox(height: 16),
            // زر مع أيقونة
            CustomButton.primary(
              text: 'زر مع أيقونة',
              onPressed: () {},
              icon: const Icon(Icons.add, size: 20),
            ),
            const SizedBox(height: 16),
            // زر معطل
             CustomButton.primary(
              text: 'زر معطل',
              onPressed: (){},
              isDisabled: true,
            ),
            const SizedBox(height: 16),
            // زر جاري التحميل
             CustomButton.primary(
              text: 'جاري التحميل',
              onPressed: (){},
              isLoading: true,
            ),
            const SizedBox(height: 30),
            const Text(
              'نموذج إدخال',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: const Icon(Icons.email),
                hintText: 'أدخل بريدك الإلكتروني',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: const Icon(Icons.lock),
                hintText: 'أدخل كلمة المرور',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton.primary(
              text: 'تسجيل الدخول',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('جاري تسجيل الدخول...'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
