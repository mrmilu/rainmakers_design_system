# 🎨 RMText - Guía Completa de Estilos

## ✨ Todos los estilos del TextTheme disponibles

El `RMText` ahora incluye **TODOS** los estilos estándar del Material Design TextTheme:

### 📏 **Display Styles** (Títulos más grandes)
- `RMText.displayLarge()` - 57px, Bold - Para héroes y headers principales
- `RMText.displayMedium()` - 45px, Bold - Headers de sección importantes  
- `RMText.displaySmall()` - 36px, Bold - Headers de subsección

### 📰 **Headline Styles** (Títulos medianos)
- `RMText.headlineLarge()` - 32px, Bold - Títulos de página
- `RMText.headlineMedium()` - 28px, W600 - Títulos de sección
- `RMText.headlineSmall()` - 24px, W600 - Subtítulos importantes

### 🏷️ **Title Styles** (Títulos pequeños)
- `RMText.titleLarge()` - 22px, W500 - Títulos de cards
- `RMText.titleMedium()` - 20px, W500 - Títulos de listas
- `RMText.titleSmall()` - 18px, W500 - Títulos menores

### 📝 **Body Styles** (Texto de contenido)
- `RMText.bodyLarge()` - 16px, Normal - Texto principal
- `RMText.bodyMedium()` - 14px, Normal - Texto estándar
- `RMText.bodySmall()` - 12px, Normal - Texto auxiliar

### 🏷️ **Label Styles** (Etiquetas y botones)
- `RMText.labelLarge()` - 16px, W600 - Botones grandes
- `RMText.labelMedium()` - 14px, W600 - Botones estándar
- `RMText.labelSmall()` - 12px, W600 - Etiquetas pequeñas

## 🛠️ Todos los parámetros disponibles

Cada método RMText soporta TODOS los parámetros del widget Text:

```dart
RMText.bodyMedium(
  'Mi texto',
  key: Key('mi-texto'),
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  height: 1.5,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.underline,
  maxLines: 2,
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  softWrap: true,
  textDirection: TextDirection.ltr,
)
```

## 🎯 Ejemplos de uso por categoría

### 🏠 **Para Headers de App**
```dart
// Hero principal
RMText.displayLarge('Bienvenido', color: Colors.blue)

// Título de página
RMText.headlineLarge('Mi Dashboard')

// Subtítulo de sección
RMText.headlineMedium('Estadísticas')
```

### 📋 **Para Contenido de Cards**
```dart
Card(
  child: Column(
    children: [
      RMText.titleMedium('Producto Premium'),
      RMText.bodyMedium('Descripción del producto...'),
      RMText.bodySmall('Información adicional'),
    ],
  ),
)
```

### 🔘 **Para Botones y Controles**
```dart
ElevatedButton(
  child: RMText.labelMedium('Comprar Ahora'),
  onPressed: () {},
)

Chip(
  label: RMText.labelSmall('Oferta'),
)
```

### 📱 **Para Listas**
```dart
ListTile(
  title: RMText.titleMedium('Item de lista'),
  subtitle: RMText.bodySmall('Descripción del item'),
  trailing: RMText.labelMedium('Acción'),
)
```

## 🎨 Jerarquía visual recomendada

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // 1. Hero/Display (más grande)
    RMText.displayMedium('App Principal'),
    
    // 2. Headline (grande)
    RMText.headlineLarge('Sección Principal'),
    
    // 3. Title (mediano)
    RMText.titleMedium('Subsección'),
    
    // 4. Body (texto normal)
    RMText.bodyMedium('Contenido principal del texto...'),
    
    // 5. Label/Small (menor)
    RMText.bodySmall('Información adicional'),
  ],
)
```

## ⚡ Performance

**Todos los métodos RMText son igualmente eficientes:**
- ✅ Retornan directamente un widget `Text`
- ✅ Sin overhead de StatelessWidget
- ✅ Óptimos para listas largas
- ✅ Misma performance que Text() nativo

## 🔄 Migración desde Text tradicional

```dart
// ❌ Antes (verbose)
Text(
  'Mi texto',
  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)

// ✅ Ahora (conciso)
RMText.bodyMedium(
  'Mi texto',
  color: Colors.blue,
  fontWeight: FontWeight.bold,
)
```

## 🎯 Tips de uso

1. **Display**: Para heroes y headers principales
2. **Headline**: Para títulos de página y sección  
3. **Title**: Para títulos de componentes (cards, listas)
4. **Body**: Para contenido de texto principal
5. **Label**: Para botones, chips y etiquetas

**¡Ahora tienes acceso completo a todo el sistema tipográfico de Material Design con la simplicidad de RMText!** 🚀
