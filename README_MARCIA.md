# 🌟 Marcia Guerrón - Coach y Mentora de Finanzas

Sitio web profesional con diseño **Glassmorphism** (efecto cristal) y sistema de **tema claro/oscuro** completamente funcional.

## ✨ Características

- **Diseño Glassmorphism Premium**: Efectos de cristal translúcido estilo iPhone
- **Tema Claro/Oscuro**: Cambio fluido entre modos con animaciones suaves
- **Paleta Dorada**: Colores dorados metálicos profesionales
- **Totalmente Responsive**: Adaptado a móviles, tablets y desktop
- **Animaciones Suaves**: Transiciones elegantes con Framer Motion
- **Sin Errores**: Código limpio y optimizado

## 🎨 Páginas Incluidas

1. **BIENVENIDOS** (`/`) - Página de inicio con hero section y cursos destacados
2. **CURSOS** (`/cursos`) - Lista completa de cursos con detalles y precios
3. **MI HISTORIA** (`/mi-historia`) - Historia personal y misión
4. **CONTACTO** (`/contacto`) - Formulario de contacto y redes sociales

## 📋 Requisitos Previos

- **Node.js** versión 18 o superior
- **npm** (viene con Node.js)

### Instalar Node.js

1. Descarga Node.js desde: https://nodejs.org/
2. Elige la versión **LTS** (Long Term Support)
3. Ejecuta el instalador y sigue las instrucciones
4. Verifica la instalación:
   ```bash
   node --version
   npm --version
   ```

## 🚀 Inicio Rápido

### Opción 1: Usando el Script (Más Fácil)

1. Haz doble clic en `INICIAR_PROYECTO.bat`
2. El script instalará dependencias (solo la primera vez) y abrirá el servidor

### Opción 2: Usando la Terminal

```bash
# 1. Instalar dependencias (solo la primera vez)
npm install

# 2. Iniciar servidor de desarrollo
npm run dev
```

El sitio estará disponible en: **http://localhost:5173**

## 🎯 Información de Contacto en el Sitio

- **WhatsApp**: +34 654 28 16 33
- **Email**: marciguerron75@gmail.com
- **Instagram**: @soy_marcia_guerron
- **Facebook**: Marcia Iralda Guerrón Caicedo
- **Web**: www.marciaguerron.com

## 🎨 Sistema de Temas

El sitio incluye un sistema completo de temas con:

- **Modo Claro**: Fondos blancos translúcidos con dorado
- **Modo Oscuro**: Fondos negros translúcidos con dorado brillante
- **Botón de cambio**: Ubicado en la esquina superior derecha del header
- **Persistencia**: El tema elegido se guarda en el navegador

## 🛠️ Tecnologías Utilizadas

- **React 18** - Framework principal
- **Vite** - Build tool ultra-rápido
- **Tailwind CSS** - Estilos utility-first
- **Framer Motion** - Animaciones fluidas
- **React Router** - Navegación entre páginas
- **React Icons** - Iconos modernos
- **React Hot Toast** - Notificaciones elegantes

## 📱 Diseño Responsive

El sitio está completamente optimizado para:

- 📱 Móviles (320px - 767px)
- 📱 Tablets (768px - 1023px)
- 💻 Desktop (1024px+)

## 🎓 Cursos Incluidos

### 1. Sembrando Mentes de Riqueza
- **Precio**: €47 (antes €97)
- **Duración**: 21+ horas
- **Incluye**: Certificado, comunidad, herramientas

### 2. Sanando Heridas de la Infancia
- **Precio**: €47 (antes €75)
- **Duración**: 10+ horas
- **Incluye**: Certificado, comunidad, meditaciones

### 3. Integración y Crecimiento en Pareja
- **Estado**: Próximamente
- **Duración**: 15+ horas

## 📦 Comandos Disponibles

```bash
# Desarrollo
npm run dev          # Inicia servidor de desarrollo

# Producción
npm run build        # Crea versión optimizada para producción
npm run preview      # Preview de la versión de producción

# Limpieza
npm run clean        # Elimina node_modules y archivos temporales
```

## 🎨 Personalización del Tema

Los colores y efectos se pueden personalizar en:
- `src/styles/glassmorphism.css` - Efectos de cristal y variables CSS
- `src/context/ThemeContext.jsx` - Lógica del tema

### Variables CSS principales:

```css
--accent-gold: rgba(212, 175, 55, 0.95);  /* Dorado principal */
--glass-bg: rgba(255, 255, 255, 0.25);    /* Fondo cristal claro */
--blur-strength: 10px;                     /* Intensidad del blur */
```

## 🔧 Solución de Problemas

### El servidor no inicia
```bash
# Eliminar node_modules y reinstalar
npm run clean
npm install
npm run dev
```

### Errores de dependencias
```bash
# Actualizar npm
npm install -g npm@latest

# Limpiar cache
npm cache clean --force
npm install
```

### Puerto ocupado
Si el puerto 5173 está en uso, Vite automáticamente usará el siguiente disponible (5174, 5175, etc.)

## 📞 Soporte

Para cualquier problema o consulta:
- Email: marciguerron75@gmail.com
- WhatsApp: +34 654 28 16 33

## 📄 Licencia

© 2024 Marcia Guerrón. Todos los derechos reservados.

---

**Desarrollado con ❤️ para transformar vidas**
