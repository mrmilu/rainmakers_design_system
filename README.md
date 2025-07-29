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
  // ✅ CONFIGURACIÓN BÁSICA
  RMConfig(
    colors: RMColors(
      primaryColor: Colors.blue,
      secondaryColor: Colors.green,
      specificBasicWhiteColor: Color(0xFFF8F8F8),
    ),
    // textTheme es opcional - usa valores por defecto si no se proporciona
  );

  // ✅ CONFIGURACIÓN CON TEXTTHEME PERSONALIZADO
  final customTextTheme = TextTheme(
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    // ... más estilos de Material Design
  );
  
  RMConfig(
    colors: RMColors(primaryColor: Colors.blue),
    textTheme: customTextTheme,  // 🎯 Gestión automática de tipografía
  );

  // ✅ CONFIGURACIÓN DESDE TEMA EXISTENTE
  RMConfig(
    colors: RMColors(primaryColor: Colors.purple),
    textTheme: ThemeData.light().textTheme,  // Usar tema de Material Design
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

## 📝 Gestión de Tipografía

El design system gestiona automáticamente la tipografía a través de `TextTheme`, proporcionando una integración perfecta con Material Design.

### API Simplificada
```dart
// RMConfig solo necesita 3 parámetros:
RMConfig(
  colors: RMColors(...),     // Gestión de colores
  textTheme: TextTheme(...), // Gestión de tipografía (opcional)
  themeData: RMThemeData(),  // Gestión de temas (opcional)
)
```

### Configuración con TextTheme Personalizado
```dart
final customTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
  titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
  // ... todos los estilos de Material Design
);

RMConfig(
  colors: RMColors(primaryColor: Colors.blue),
  textTheme: customTextTheme,
);

// Uso en widgets - ambas formas funcionan
Text('Título', style: RMTextStyles.titleMediumStyle);
Text('Título', style: Theme.of(context).textTheme.titleMedium);
```

### Desde Tema Existente
```dart
// Usar TextTheme de Material Design
RMConfig(
  textTheme: ThemeData.light().textTheme,
  colors: RMColors(primaryColor: Colors.purple),
);

// O desde Google Fonts
RMConfig(
  textTheme: GoogleFonts.robotoTextTheme(),
  colors: RMColors(primaryColor: Colors.green),
);
```

### Valores por Defecto
```dart
// Si no proporcionas textTheme, usa valores predefinidos optimizados
RMConfig(
  colors: RMColors(primaryColor: Colors.blue),
  // textTheme se genera automáticamente con valores por defecto
);
```

### Beneficios de la Nueva API
- **Simplicidad**: Solo 3 parámetros en RMConfig
- **Compatibilidad**: Funciona con cualquier TextTheme de Material Design
- **Automatización**: Conversión automática a RMTextStyles internamente
- **Flexibilidad**: Acceso tanto por RMTextStyles como por Theme.of(context)

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

## 🎨 Assets del Design System

El design system incluye iconos predefinidos que se pueden usar de forma sencilla. Para usar assets del package, es importante usar las rutas correctas.

### Uso de Iconos Incluidos

```dart
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

// Widgets con iconos predefinidos
RMRowIconTextWidget.info('Información importante')
RMRowIconTextWidget.warning('Advertencia')
RMRowIconTextWidget.error('Error encontrado')

// Usar iconos en otros widgets
RMIconButton.primary(
  iconPath: RMAssets.iconInfo,
  onPressed: () {},
)
```

### Iconos Disponibles

```dart
// Iconos predefinidos
RMAssets.iconInfo      // Icono de información
RMAssets.iconWarning   // Icono de advertencia  
RMAssets.iconError     // Icono de error
```

### Agregar Iconos Personalizados

Si necesitas agregar iconos personalizados al package:

1. **Agrega el icono** a la carpeta `assets/icons/` del package
2. **Actualiza el pubspec.yaml** si es necesario
3. **Usa la utilidad** para generar la ruta correcta:

```dart
// Para un icono personalizado
RMIconButton.primary(
  iconPath: RMAssets.iconPath('mi_icono_personalizado.svg'),
  onPressed: () {},
)

// O para cualquier asset del package
String miAsset = RMAssets.assetPath('images/logo.png');
```

### ⚠️ Importante

Cuando uses el design system como package, **NO uses rutas como** `'assets/icons/icon.svg'` directamente. En su lugar:

```dart
// ❌ INCORRECTO - No funcionará desde un package
iconPath: 'assets/icons/info.svg'

// ✅ CORRECTO - Usa las constantes del design system
iconPath: RMAssets.iconInfo

// ✅ CORRECTO - Para iconos personalizados
iconPath: RMAssets.iconPath('mi_icono.svg')
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

Desarrollado con ❤️ por el equipo de [Rainmakers](https://www.werainmakers.com/)
