# Flutter Challenge App

> **Flutter Challenge App** es una aplicación que te permite explorar productos desde una API, ver los detalles de cada producto y navegar sin problemas entre pantallas.

---

## Funcionalidades Clave:

- **Explora Productos**: Navega a través de una amplia colección de productos, con soporte para paginación y scroll infinito.
- **Detalles del Producto**: Obtén información detallada sobre cada producto, incluyendo precio, descripción, imágenes y reseñas de usuarios.
- **Navegación Simple**: Navega fácilmente desde la lista de productos a la página de detalles de cualquier producto con un toque.
- **Pull-to-Refresh**: Actualiza la lista de productos con un gesto de "pull-to-refresh".
- **Renderización Dinámica**: Mejora la experiencia de usuario con transiciones suaves usando el widget `Hero`.

---

## Capturas 🚀
<p align="center">
  <!-- TODO update gif to show icon in `overlay` -->
  <img width="300" height="600" src="[https://media.giphy.com/media/f9SzoZKqo1vfdlCaT5/giphy.gif](https://github.com/juanbendavid/challenge_app/blob/main/image.png)">
</p>


## Empezando 🚀

Sigue estos pasos para configurar y ejecutar la aplicación Flutter en tu entorno de desarrollo local.

### Requisitos:

**Versión utilizada en el proyecto**:
- Flutter 3.13.9
- Dart 3.1.5
- DevTools 2.25.0

### Clonar el repositorio:

1. Clona el proyecto en tu máquina local:

`git clone <URL_DEL_REPOSITORIO>`  
`cd nombre-del-proyecto`

2. Instala las dependencias del proyecto ejecutando el siguiente comando:

`flutter pub get`

### Ejecutar la aplicación:

Con tu entorno de desarrollo configurado (emulador o dispositivo físico conectado), puedes ejecutar la aplicación usando los siguientes comandos:

1. **Para Android**:

`flutter run`

2. **Para iOS** (solo en macOS):

`flutter run`

3. **Especificar el dispositivo**:

Si tienes varios dispositivos conectados, puedes especificar el dispositivo usando:

`flutter run -d <device_id>`

Para listar los dispositivos disponibles:

`flutter devices`

---

## Ejecutar Pruebas 🧪

El proyecto cuenta con pruebas de widgets y unitarias para asegurar la calidad de la aplicación. Para ejecutar las pruebas, usa el siguiente comando:

`flutter test`

---

## Compilación 📦

1. **Para Android (APK)**:

`flutter build apk --release`

2. **Para iOS (IPA)** (solo en macOS):

`flutter build ios --release`

---

## Próximos pasos en la implementación:

- **Implementar Go Router**: Para mejorar la navegación dentro de la aplicación.
- **Implementar inyección de dependencias**: Para mejorar la modularidad y mantenibilidad del código.
- **Recordar productos favoritos**: Implementar la funcionalidad de favoritos para recordar las preferencias de los usuarios.

---

