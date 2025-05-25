# Designify - Custom Flutter Component Library

Designify is a library that provides a set of ready-made and custom components for developing Flutter applications professionally. The components are designed to be easy to use and fully customizable, with full support for the Arabic language and RTL direction.

## Features

- 🎨 Attractive and ready-to-use user interfaces
- ⚡ High performance and easy to use
- 🛠️ Easy to customize and extend
- 📱 Compatible with all screen sizes
- 🌍 Full support for Arabic language and RTL direction

## Installation

Add the library to your `pubspec.yaml` file:

```yaml
dependencies:
  designify: ^0.0.1
  google_fonts: ^6.1.0  # Required for custom font support
```

Then run:

```bash
flutter pub get
```

## Usage

Import the library into your file:

```dart
import 'package:designify/designify.dart';
```

## Available Components

### 1. DesignifyText - Custom Text

A component for displaying text with consistent formatting in the application.

#### Basic Usage:

```dart
// Normal text
DesignifyText('Welcome to the app');

// Bold text
DesignifyText('This is bold text', isBold: true);

// Heading
DesignifyText.heading('Main Heading');

// Subtitle
DesignifyText.subtitle('Subheading');
```

#### Available Properties:
- `text`: The text to display
- `fontSize`: Font size (default: 14.0)
- `isBold`: If the text is bold (default: false)
- `color`: Text color
- `maxLines`: Maximum number of lines
- `textAlign`: Text alignment
- `overflow`: Text overflow behavior
- `fontWeight`: Font weight
- `letterSpacing`: Spacing between characters
- `height`: Line height
- `decoration`: Text decoration (underline, etc.)

---

### 2. DesignifyButton - Custom Button

A custom button with multiple customization options.

#### Basic Usage:

```dart
// Basic button
DesignifyElevatedButton(
  text: 'Login',
  onPressed: () {
    // Button actions
  },
);

// Disabled button
DesignifyElevatedButton(
  text: 'Disabled Button',
  onPressed: null,
  isDisabled: true,
);

// Loading button
DesignifyElevatedButton(
  text: 'Loading...',
  onPressed: () {},
  isLoading: true,
);

// Outlined button
DesignifyElevatedButton.outlined(
  text: 'Cancel',
  onPressed: () {},
);
```

#### Available Properties:
- `text`: Button text (required)
- `onPressed`: Callback function when clicked (required)
- `isLoading`: Display loading state (default: false)
- `isDisabled`: Disable the button (default: false)
- `isFullWidth`: Fill available width (default: false)
- `padding`: Internal padding of the button
- `textStyle`: Text styling
- `backgroundColor`: Background color
- `foregroundColor`: Text and icon color
- `elevation`: Shadow elevation
- `borderRadius`: Corner radius
- `borderColor`: Border color (for outlined buttons)
- `icon`: Icon next to the text

---

### 3. DesignifyInputField - Custom Input Field

An input field with an integrated design and multiple customization options.

#### Basic Usage:

```dart
// Normal input field
DesignifyInputField(
  label: 'Username',
  controller: _usernameController,
);

// Input field with prefix icon
DesignifyInputField.withPrefixIcon(
  label: 'Email',
  icon: Icons.email,
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
);

// Password field
DesignifyInputField.password(
  label: 'Password',
  controller: _passwordController,
  showPassword: _showPassword,
  onToggleVisibility: () {
    setState(() {
      _showPassword = !_showPassword;
    });
  },
);
```

#### Available Properties:
- `label`: Label text (required)
- `controller`: Input field controller
- `keyboardType`: Keyboard type (default: TextInputType.text)
- `hintText`: Hint text
- `obscureText`: Obscure text (useful for passwords)
- `prefixIcon`: Prefix icon
- `suffixIcon`: Suffix icon
- `validator`: Function to validate input
- `maxLines`: Maximum number of lines (default: 1)
- `enabled`: Enable/disable the field (default: true)
- `borderColor`: Border color (default: Colors.grey)
- `borderRadius`: Corner radius (default: 8.0)
- `autofocus`: Autofocus on the field
- `textInputAction`: Input action button
- `onChanged`: Callback function when text changes
- `onSubmitted`: Callback function when text is submitted
- `textCapitalization`: Text capitalization
- `readOnly`: Read-only
- `showCounter`: Show character counter
- `maxLength`: Maximum number of characters
- `contentPadding`: Internal padding of the field

---

### 4. DesignifyPicker - Custom Picker

A modern-designed list picker.

#### Basic Usage:

```dart
DesignifyPicker(
  title: 'Select City',
  items: ['Riyadh', 'Jeddah', 'Dammam', 'Makkah', 'Madinah'],
  onChanged: (value) {
    print('Selected city: $value');
  },
  hintText: 'Select from the list',
);
```

#### Available Properties:
- `title`: Picker title
- `items`: List of available items
- `onChanged`: Callback function when value changes
- `hintText`: Default text
- `borderColor`: Border color
- `backgroundColor`: Background color
- `closeButtonText`: Close button text
- `defaultItemText`: Default item text
- `itemExtent`: Item height
- `pickerHeight`: Dropdown list height

## Requirements

- Flutter SDK: ^3.0.0
- Dart SDK: ^3.0.0
- google_fonts: ^6.1.0 (for custom fonts)

## Support

For any inquiries or issues, please open a new [issue](https://github.com/7Haitham/designify/issues/new).

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

We welcome your contributions! Please read the [Contribution Guide](CONTRIBUTING.md) for more details.
