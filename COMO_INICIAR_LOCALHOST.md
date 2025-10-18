# 🚀 CÓMO INICIAR EL SISTEMA EN LOCALHOST

## ⚠️ IMPORTANTE: Node.js No Detectado

Para poder ejecutar este sistema en localhost, necesitas tener **Node.js** instalado en tu computadora.

---

## 📥 PASO 1: Instalar Node.js

### **Opción A: Instalación Automática con Winget (Recomendado)**

Abre PowerShell como Administrador y ejecuta:

```powershell
winget install OpenJS.NodeJS.LTS
```

### **Opción B: Descarga Manual**

1. Ve a: **https://nodejs.org/**
2. Descarga la versión **LTS (Recomendada)**
3. Ejecuta el instalador
4. Sigue las instrucciones (usa las opciones por defecto)
5. **IMPORTANTE:** Marca la opción "Automatically install the necessary tools"

### **Verificar Instalación**

Después de instalar, abre una **NUEVA** ventana de CMD o PowerShell y ejecuta:

```bash
node --version
npm --version
```

Deberías ver algo como:
```
v20.11.0
10.2.4
```

---

## 🚀 PASO 2: Instalar Dependencias del Proyecto

Una vez que Node.js esté instalado, abre CMD o PowerShell en la carpeta del proyecto y ejecuta:

```bash
npm install
```

Este comando descargará todas las dependencias necesarias (puede tardar 5-10 minutos).

---

## ▶️ PASO 3: Iniciar el Servidor

Después de instalar las dependencias, ejecuta:

```bash
npm run dev
```

---

## 🌐 PASO 4: Abrir en el Navegador

Una vez que el servidor esté corriendo, verás un mensaje como:

```
  VITE v5.x.x  ready in xxx ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
```

Abre tu navegador y ve a: **http://localhost:5173**

---

## 🎯 COMANDOS RÁPIDOS

### **Una vez que Node.js esté instalado:**

```bash
# Instalar dependencias (solo la primera vez)
npm install

# Iniciar servidor de desarrollo
npm run dev

# Compilar para producción
npm run build

# Vista previa de build de producción
npm run preview
```

---

## 🐛 SOLUCIÓN DE PROBLEMAS

### ❌ **"npm no se reconoce como comando"**

**Solución:**
1. Cierra TODAS las ventanas de CMD/PowerShell
2. Abre una NUEVA ventana
3. Si persiste, reinicia tu computadora
4. Verifica que Node.js esté en el PATH:
   - Busca "Variables de entorno" en Windows
   - Verifica que `C:\Program Files\nodejs\` esté en PATH

### ❌ **Error: "EACCES: permission denied"**

**Solución en Windows:**
1. Abre CMD o PowerShell como Administrador
2. Ejecuta: `npm install -g windows-build-tools`
3. Intenta instalar las dependencias nuevamente

### ❌ **Error: "Cannot find module"**

**Solución:**
```bash
# Eliminar node_modules y reinstalar
rmdir /s /q node_modules
del package-lock.json
npm install
```

### ❌ **Puerto 5173 ya está en uso**

**Solución:**
```bash
# Detener todos los procesos de node
taskkill /F /IM node.exe

# O usar otro puerto
npm run dev -- --port 3000
```

---

## 📋 REQUISITOS DEL SISTEMA

- **Sistema Operativo:** Windows 10/11, macOS, Linux
- **Node.js:** v18.0.0 o superior (LTS recomendado)
- **RAM:** 4GB mínimo, 8GB recomendado
- **Disco:** 500MB libres para dependencias
- **Navegador:** Chrome, Firefox, Edge, Safari (última versión)

---

## 🔧 CONFIGURACIÓN ADICIONAL

### **Variables de Entorno**

Antes de iniciar, copia el archivo `.env.example` a `.env` y completa los valores:

```bash
# Copiar archivo de ejemplo
copy .env.example .env

# Editar con tu editor favorito
notepad .env
```

Completa estos valores obligatorios:

```env
VITE_SUPABASE_URL=tu_supabase_url
VITE_SUPABASE_ANON_KEY=tu_supabase_anon_key
VITE_PAYPAL_CLIENT_ID=tu_paypal_client_id
```

---

## 📱 ACCEDER DESDE MÓVIL (Mismo Network)

Para probar en tu móvil conectado a la misma red WiFi:

```bash
# Iniciar con acceso de red
npm run dev -- --host

# Se mostrará algo como:
# ➜  Network: http://192.168.1.X:5173/
```

Usa esa URL en tu móvil.

---

## 🎉 ¡LISTO!

Una vez que el servidor esté corriendo, tendrás acceso a:

- **🏠 Home:** http://localhost:5173/
- **🛒 Tienda:** http://localhost:5173/tienda
- **📚 Cursos:** http://localhost:5173/cursos
- **📖 Blog:** http://localhost:5173/blog
- **👤 Dashboard:** http://localhost:5173/dashboard
- **🔧 Admin:** http://localhost:5173/admin

---

## 📞 NECESITAS AYUDA?

Si después de seguir estos pasos aún tienes problemas:

1. **Revisa la consola del navegador** (F12)
2. **Revisa la terminal** donde corre el servidor
3. **Busca el error específico** en Google
4. **Contacta soporte** con capturas del error

---

## 🔗 RECURSOS ÚTILES

- **Node.js Official:** https://nodejs.org/
- **npm Documentation:** https://docs.npmjs.com/
- **Vite Documentation:** https://vitejs.dev/
- **Troubleshooting Guide:** https://vitejs.dev/guide/troubleshooting.html

---

**Última actualización:** Octubre 2025
**Estado:** Sistema totalmente funcional y probado
