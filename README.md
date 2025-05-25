# Designify - مكتبة مكونات Flutter مخصصة

مكتبة Designify توفر مجموعة من المكونات الجاهزة والمخصصة لتطوير تطبيقات Flutter باحترافية. تم تصميم المكونات لتكون سهلة الاستخدام وقابلة للتخصيص بالكامل مع دعم كامل للغة العربية واتجاه RTL.

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
DesignifyElevatedButton(
  text: 'تسجيل الدخول',
  onPressed: () {
    // إجراءات الزر
  },
);

// زر معطل
DesignifyElevatedButton(
  text: 'زر معطل',
  onPressed: null,
  isDisabled: true,
);

// زر تحميل
DesignifyElevatedButton(
  text: 'جاري التحميل',
  onPressed: () {},
  isLoading: true,
);

// زر مخطط
DesignifyElevatedButton.outlined(
  text: 'إلغاء',
  onPressed: () {},
);
```

#### الخصائص المتاحة:
- `text`: نص الزر (مطلوب)
- `onPressed`: دالة الاستدعاء عند النقر (مطلوبة)
- `isLoading`: عرض حالة التحميل (الافتراضي: false)
- `isDisabled`: تعطيل الزر (الافتراضي: false)
- `isFullWidth`: ملء العرض المتاح (الافتراضي: false)
- `padding`: الحشو الداخلي للزر
- `textStyle`: تنسيق النص
- `backgroundColor`: لون الخلفية
- `foregroundColor`: لون النص والأيقونة
- `elevation`: ارتفاع الظل
- `borderRadius`: نصف قطر الزوايا
- `borderColor`: لون الحدود (للأزرار المخططة)
- `icon`: أيقونة بجانب النص

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
- `label`: نص التسمية (مطلوب)
- `controller`: متحكم بحقل الإدخال
- `keyboardType`: نوع لوحة المفاتيح (الافتراضي: TextInputType.text)
- `hintText`: نص تلميحي
- `obscureText`: إخفاء النص (مفيد لكلمات المرور)
- `prefixIcon`: أيقونة بادئة
- `suffixIcon`: أيقونة لاحقة
- `validator`: دالة للتحقق من صحة الإدخال
- `maxLines`: الحد الأقصى لعدد الأسطر (الافتراضي: 1)
- `enabled`: تفعيل/تعطيل الحقل (الافتراضي: true)
- `borderColor`: لون الحدود (الافتراضي: Colors.grey)
- `borderRadius`: نصف قطر الزوايا (الافتراضي: 8.0)
- `autofocus`: التركيز التلقائي على الحقل
- `textInputAction`: إجراء زر الإدخال
- `onChanged`: دالة الاستدعاء عند تغيير النص
- `onSubmitted`: دالة الاستدعاء عند إرسال النص
- `textCapitalization`: تنسيق الحروف
- `readOnly`: للقراءة فقط
- `showCounter`: عرض عداد الأحرف
- `maxLength`: الحد الأقصى لعدد الأحرف
- `contentPadding`: الحشو الداخلي للحقل

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

## المتطلبات

- Flutter SDK: ^3.0.0
- Dart SDK: ^3.0.0
- google_fonts: ^6.1.0 (للخطوط المخصصة)

## الدعم

لأي استفسارات أو مشاكل، يرجى فتح [issue](https://github.com/7Haitham/designify/issues/new) جديد.

## الترخيص

هذا المشروع مرخص تحت [MIT License](LICENSE).

## المساهمة

نرحب بمساهماتك! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للمزيد من التفاصيل.
