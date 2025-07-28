# Rainmakers Design System

Una librería completa de sistema de diseño para Flutter que proporciona componentes reutilizables, gestión de colores, tipografía y temas para crear aplicaciones con una interfaz consistente y profesional.

[![pub package](https://img.shields.io/pub/v/rainmakers_design_system.svg)](https://pub.dev/packages/rainmakers_design_system)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## ✨ Características

- 🎨 **Gestión de Colores**: Sistema completo de colores configurables con soporte para temas claros y oscuros
- 📝 **Tipografía**: Estilos de texto predefinidos y personalizables
- 🎯 **Temas**: Generación automática de temas de Material Design
- 🧩 **Componentes UI**: Widgets prediseñados listos para usar
- 🔧 **Utilidades**: Extensiones y herramientas para desarrollo eficiente
- ⚡ **Configuración Simple**: API intuitiva para personalización rápida

## 📦 Instalación

Agrega el paquete a tu `pubspec.yaml`:

```yaml
dependencies:
  rainmakers_design_system: ^0.0.1
```

Luego ejecuta:

```bash
flutter pub get
```

## 🚀 Uso Básico

### 1. Configuración Inicial

```dart
import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

void main() {
  // Configurar el design system
  RMConfig(
    colors: RMColors(
      primaryColor: Colors.blue,
      secondaryColor: Colors.green,
      specificBasicWhiteColor: Color(0xFFF8F8F8),
    ),
    typography: RMTextStyles(),
    themeData: RMThemeData.fromConfigured(),
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: RMConfig.lightTheme,  // Tema generado automáticamente
      darkTheme: RMConfig.darkTheme,
      home: HomeScreen(),
    );
  }
}
```

### 2. Usando Colores

```dart
// Acceso a colores configurados
Container(
  color: RMColors.primary,           // Color primario
  child: Text(
    'Hola Mundo',
    style: TextStyle(
      color: RMColors.specificBasicWhite,  // Color específico
    ),
  ),
)

// Colores semánticos disponibles
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: RMColors.specificSemanticSuccess,  // Verde de éxito
  ),
  onPressed: () {},
  child: Text('Guardar'),
)
```

### 3. Usando Tipografía

```dart
// Estilos de texto predefinidos
Column(
  children: [
    RMTextHeader('Título Principal'),
    RMTextTitle('Subtítulo'),
    RMTextBody('Contenido del cuerpo'),
    RMTextCaption('Texto pequeño'),
  ],
)
```

## 🎨 Sistema de Colores

### Colores Primarios
- `primary`, `secondary`, `tertiary`
- `background`, `onBackground`, `surface`

### Colores Específicos
- **Básicos**: `specificBasicBlack`, `specificBasicWhite`, `specificBasicGrey`
- **Contenido**: `specificContentHigh`, `specificContentMid`, `specificContentLow`
- **Bordes**: `specificBorderMid`, `specificBorderLow`
- **Semánticos**: `specificSemanticError`, `specificSemanticWarning`, `specificSemanticSuccess`, `specificSemanticInfo`

### Configuración de Colores Personalizados

```dart
RMConfig(
  colors: RMColors(
    primaryColor: Color(0xFF1976D2),
    secondaryColor: Color(0xFF388E3C),
    specificSemanticErrorColor: Color(0xFFD32F2F),
    specificSemanticSuccessColor: Color(0xFF388E3C),
    // ... más colores
  ),
);
```

## 🧩 Componentes Disponibles

### Botones
```dart
// Botón elevado personalizado
RMCustomElevatedButton(
  text: 'Acción Principal',
  onPressed: () {},
)

// Botón con icono
RMCustomIconButton(
  icon: Icons.favorite,
  onPressed: () {},
)

// Botón de texto
RMCustomTextButton(
  text: 'Acción Secundaria',
  onPressed: () {},
)
```

### Campos de Entrada
```dart
// Campo de texto personalizado
RMCustomTextFieldWidget(
  label: 'Nombre',
  hint: 'Ingresa tu nombre',
)

// Campo de teléfono con formato
RMCustomPhoneFieldWidget(
  onChanged: (phone) => print(phone),
)

// Campo IBAN
RMCustomIbanFieldWidget(
  onChanged: (iban) => print(iban),
)

// Dropdown personalizado
RMCustomDropdownFieldWidget<String>(
  items: ['Opción 1', 'Opción 2'],
  onChanged: (value) => print(value),
)
```

### Otros Componentes
```dart
// Checkbox personalizado
RMCustomCheckboxWidget(
  value: true,
  onChanged: (value) {},
)

// Switch personalizado
RMCustomSwitchWidget(
  value: false,
  onChanged: (value) {},
)

// Slider personalizado
RMCustomSliderWidget(
  value: 0.5,
  onChanged: (value) {},
)

// Tags
RMCustomTagWidget(text: 'Etiqueta')
RMCustomTagIconWidget(
  text: 'Con Icono',
  icon: Icons.star,
)

// Indicador de progreso
RMCircularProgress()
```

## 🔧 Utilidades

### Extensiones
```dart
// Extensiones de Color
Color myColor = Colors.blue.withOpacityValue(128);

// Extensiones de String
String text = "hola mundo".capitalize(); // "Hola mundo"
bool isValid = "test@email.com".isValidEmail();

// Extensiones de DateTime
String formatted = DateTime.now().toFormattedString();

// Extensiones de double
String currency = 1234.56.toCurrency(); // "$1,234.56"
```

### Formateadores
```dart
// Formateador de teléfono
RMPhoneFormatter phoneFormatter = RMPhoneFormatter();

// Debouncer para búsquedas
Debouncer debouncer = Debouncer(milliseconds: 500);
debouncer.run(() {
  // Acción después del delay
});
```

## 📖 Documentación Avanzada

### Configuración Completa

```dart
RMConfig(
  colors: RMColors(
    // Colores primarios
    primaryColor: Color(0xFF1976D2),
    secondaryColor: Color(0xFF388E3C),
    tertiaryColor: Color(0xFFFF9800),
    
    // Colores de fondo
    backgroundColor: Colors.white,
    surfaceColor: Color(0xFFF5F5F5),
    
    // Colores específicos del contenido
    specificContentHighColor: Color(0xFF212121),
    specificContentMidColor: Color(0xFF757575),
    
    // Colores semánticos
    specificSemanticErrorColor: Color(0xFFD32F2F),
    specificSemanticSuccessColor: Color(0xFF388E3C),
    specificSemanticWarningColor: Color(0xFFFF9800),
    specificSemanticInfoColor: Color(0xFF1976D2),
  ),
  typography: RMTextStyles(
    // Personalizar estilos de texto si es necesario
  ),
  themeData: RMThemeData.fromConfigured(), // Genera tema automáticamente
);
```

### Temas Personalizados

```dart
// Para casos específicos donde necesites un tema completamente personalizado
RMConfig(
  themeData: RMThemeData(
    lightTheme: ThemeData(
      // Tu tema personalizado claro
    ),
    darkTheme: ThemeData(
      // Tu tema personalizado oscuro
    ),
  ),
);
```

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Si encuentras algún problema o tienes una sugerencia:

1. Abre un [issue](https://github.com/mrmilu/rainmakers_design_system/issues)
2. Fork el repositorio
3. Crea una rama para tu feature
4. Haz commit de tus cambios
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - mira el archivo [LICENSE](LICENSE) para más detalles.

## 📞 Soporte

Si necesitas ayuda o tienes preguntas:
- Abre un [issue](https://github.com/mrmilu/rainmakers_design_system/issues) en GitHub
- Revisa la [documentación](https://github.com/mrmilu/rainmakers_design_system/wiki)

---

Desarrollado con ❤️ por el equipo de [Rainmakers](https://github.com/mrmilu)
