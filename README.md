# Designify - مكتبة مكونات Flutter مخصصة

مكتبة Designify توفر مجموعة من المكونات الجاهزة والمخصصة لتسريع تطوير تطبيقات Flutter الخاصة بك. تحتوي على واجهات مستخدم جذابة وسهلة التخصيص.

## المميزات

- 🎨 واجهات مستخدم جاهزة وجذابة
- ⚡ أداء عالي وسهل الاستخدام
- 🛠️ سهلة التخصيص والتوسعة
- 📱 متوافقة مع جميع أحجام الشاشات
- 🌍 دعم كامل للغة العربية واتجاه RTL

## التثبيت

أضف المكتبة إلى ملف `pubspec.yaml`:

```yaml
dependencies:
  designify: ^0.0.1
  google_fonts: ^6.1.0  # مطلوب لدعم الخطوط المخصصة
```

ثم قم بتشغيل:

```bash
flutter pub get
```

## الاستخدام

استيراد المكتبة في ملفك:

```dart
import 'package:designify/designify.dart';
```

## المكونات المتوفرة

### 1. DesignifyText - نص مخصص

مكون لعرض النصوص بتنسيق متسق في التطبيق.

#### الاستخدام الأساسي:

```dart
// نص عادي
DesignifyText('مرحباً بك في التطبيق');

// نص عريض
DesignifyText('هذا نص عريض', isBold: true);

// عنوان رئيسي
DesignifyText.heading('عنوان رئيسي');

// عنوان فرعي
DesignifyText.subtitle('عنوان فرعي');
```

#### الخصائص المتاحة:
- `text`: النص المراد عرضه
- `fontSize`: حجم الخط (الافتراضي: 14.0)
- `isBold`: إذا كان النص عريض (الافتراضي: false)
- `color`: لون النص
- `maxLines`: الحد الأقصى لعدد الأسطر
- `textAlign`: محاذاة النص
- `overflow`: سلوك تجاوز النص
- `fontWeight`: سمك الخط
- `letterSpacing`: المسافة بين الحروف
- `height`: ارتفاع السطر
- `decoration`: تزيين النص (تحته خط، إلخ)

---

### 2. DesignifyButton - زر مخصص

زر مخصص مع خيارات تخصيص متعددة.

#### الاستخدام الأساسي:

```dart
// زر أساسي
DesignifyButton.primary(
  text: 'تسجيل الدخول',
  onPressed: () {
    // إجراءات الزر
  },
);

// زر ثانوي
DesignifyButton.secondary(
  text: 'إلغاء',
  onPressed: () {
    // إجراءات الزر
  },
);

// زر مع أيقونة
DesignifyButton.primary(
  text: 'مشاركة',
  icon: Icon(Icons.share),
  onPressed: () {},
);
```

#### الخصائص المتاحة:
- `text`: نص الزر
- `onPressed`: دالة الاستدعاء عند النقر
- `backgroundColor`: لون خلفية الزر
- `textColor`: لون نص الزر
- `width`: عرض الزر
- `height`: ارتفاع الزر
- `borderRadius`: نصف قطر الزوايا
- `elevation`: ارتفاع الظل
- `isLoading`: حالة التحميل
- `isDisabled`: تعطيل الزر

---

### 3. DesignifyInputField - حقل إدخال مخصص

حقل إدخال بتصميم متكامل مع خيارات تخصيص متعددة.

#### الاستخدام الأساسي:

```dart
// حقل إدخال عادي
DesignifyInputField(
  label: 'اسم المستخدم',
  controller: _usernameController,
);

// حقل إدخال مع أيقونة
DesignifyInputField.withPrefixIcon(
  label: 'البريد الإلكتروني',
  icon: Icons.email,
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
);

// حقل كلمة مرور
DesignifyInputField.password(
  label: 'كلمة المرور',
  controller: _passwordController,
  showPassword: _showPassword,
  onToggleVisibility: () {
    setState(() {
      _showPassword = !_showPassword;
    });
  },
);
```

#### الخصائص المتاحة:
- `label`: نص التسمية
- `controller`: متحكم بحقل الإدخال
- `keyboardType`: نوع لوحة المفاتيح
- `hintText`: نص تلميحي
- `obscureText`: إخفاء النص (لحقول كلمة المرور)
- `prefixIcon`: أيقونة بادئة
- `suffixIcon`: أيقونة لاحقة
- `validator`: دالة للتحقق من صحة الإدخال
- `maxLines`: الحد الأقصى لعدد الأسطر
- `enabled`: تفعيل/تعطيل الحقل
- `borderColor`: لون الحدود
- `borderRadius`: نصف قطر الزوايا

---

### 4. DesignifyPicker - منتقي مخصص

منتقي قوائم بتصميم عصري.

#### الاستخدام الأساسي:

```dart
DesignifyPicker(
  title: 'اختر المدينة',
  items: ['الرياض', 'جدة', 'الدمام', 'مكة', 'المدينة'],
  onChanged: (value) {
    print('المدينة المختارة: $value');
  },
  hintText: 'اختر من القائمة',
);
```

#### الخصائص المتاحة:
- `title`: عنوان المنتقي
- `items`: قائمة العناصر المتاحة
- `onChanged`: دالة الاستدعاء عند تغيير القيمة
- `hintText`: النص الافتراضي
- `borderColor`: لون الحدود
- `backgroundColor`: لون الخلفية
- `closeButtonText`: نص زر الإغلاق
- `defaultItemText`: نص العنصر الافتراضي
- `itemExtent`: ارتفاع العنصر
- `pickerHeight`: ارتفاع القائمة المنسدلة

## المساهمة

نرحب بمساهماتك! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للمزيد من التفاصيل.

## الترخيص

هذا المشروع مرخص تحت [MIT License](LICENSE).

## المتطلبات

- Flutter SDK: ^3.0.0
- Dart SDK: ^3.0.0

## الدعم

لأي استفسارات أو مشاكل، يرجى فتح [issue](https://github.com/yourusername/designify/issues) جديد.
