# 🚀 CONFIGURACIÓN SUPABASE - MARCIA GUERRÓN COACH

## ✅ PASO 1: Configurar Base de Datos

### 1.1 Abrir Supabase Dashboard
1. Ve a: https://supabase.com/dashboard
2. Abre tu proyecto: **qwedielivgbjessqjscs**

### 1.2 Ejecutar Script SQL
1. En el menú lateral, clic en **SQL Editor**
2. Clic en **New Query**
3. Abre el archivo: `SUPABASE_SETUP.sql`
4. **Copia TODO el contenido** del archivo
5. **Pega** en el editor de Supabase
6. Clic en **RUN** (botón abajo a la derecha)
7. ✅ Espera a que termine (verás "Success" cuando complete)

### 1.3 Verificar Tablas Creadas
1. En el menú lateral, clic en **Table Editor**
2. Deberías ver estas tablas:
   - ✅ profiles (perfiles de usuarios)
   - ✅ courses (cursos)
   - ✅ course_modules (módulos)
   - ✅ course_lessons (lecciones)
   - ✅ enrollments (inscripciones)
   - ✅ products (productos)
   - ✅ purchases (compras)
   - ✅ subscriptions (suscripciones)
   - ✅ blog_posts (blog)
   - ✅ forum_topics (foro)
   - ✅ forum_replies (respuestas foro)
   - ✅ affiliates (afiliados)
   - ✅ referrals (referidos)
   - ✅ consultations (consultas)
   - ✅ newsletter_subscribers (suscriptores)
   - ✅ reviews (reseñas)
   - ✅ notifications (notificaciones)

---

## ✅ PASO 2: Configurar Autenticación

### 2.1 Habilitar Proveedores de Email
1. En el menú lateral, clic en **Authentication**
2. Clic en **Providers**
3. Asegúrate que **Email** esté habilitado (toggle verde)

### 2.2 Configurar Email Templates (Opcional)
1. Clic en **Email Templates**
2. Personaliza los emails de confirmación si lo deseas

---

## ✅ PASO 3: Configurar Políticas de Seguridad (RLS)

### 3.1 Verificar RLS
1. En **Table Editor**, selecciona cualquier tabla
2. Clic en el ícono de **escudo** (RLS)
3. Verifica que las políticas estén activas

Las políticas ya están creadas automáticamente por el script SQL:
- ✅ Users can view their own profile
- ✅ Users can update their own profile
- ✅ Anyone can view published courses
- ✅ Users can view their enrollments
- ✅ Users can view their purchases
- ✅ Anyone can view published blog posts

---

## ✅ PASO 4: Datos de Prueba (Opcional)

El script ya insertó algunos cursos y productos de prueba:

### Cursos Creados:
1. **Sembrando Mentes de Riqueza** - €47
2. **Sanando Heridas de la Infancia** - €47
3. **Integración en Pareja** - €47 (no publicado)

### Productos Creados:
1. **Consulta Individual 1:1** - €97
2. **Masterclass Gratuita** - €0
3. **Mentoría VIP** - €997

---

## ✅ PASO 5: Ejecutar el Proyecto

### 5.1 Verificar Configuración
Las credenciales ya están configuradas en el proyecto:
- **URL**: `https://qwedielivgbjessqjscs.supabase.co`
- **API Key**: Ya configurada en `src/main.jsx` y `src/services/supabaseService.js`

### 5.2 Iniciar Servidor
```bash
npm run dev
```

O ejecuta el archivo:
```
EJECUTAR_AHORA.bat
```

### 5.3 Abrir en Navegador
El servidor se abrirá automáticamente en:
```
http://localhost:5173
```

---

## ✅ PASO 6: Probar Funcionalidades

### 6.1 Registro de Usuario
1. Ve a http://localhost:5173/register
2. Crea una cuenta con tu email
3. Verifica tu email (revisa inbox/spam)
4. Inicia sesión

### 6.2 Ver Cursos
1. Ve a http://localhost:5173/cursos
2. Deberías ver los 2 cursos publicados
3. Clic en cualquier curso para ver detalles

### 6.3 Dashboard Cliente
1. Inicia sesión
2. Ve a http://localhost:5173/dashboard
3. Verás tu panel de usuario

### 6.4 Dashboard Admin (requiere rol admin)
1. Ve a Supabase Dashboard
2. Table Editor > profiles
3. Encuentra tu usuario
4. Cambia el campo `role` de `client` a `admin`
5. Cierra sesión y vuelve a iniciar
6. Ve a http://localhost:5173/admin

---

## 🔧 Solución de Problemas

### Error: "Failed to fetch"
- ✅ Verifica que copiaste bien las credenciales
- ✅ Revisa la consola del navegador (F12)
- ✅ Asegúrate que el proyecto de Supabase esté activo

### Error: "Invalid API key"
- ✅ Copia nuevamente la API Key desde Supabase Dashboard
- ✅ Pega en `src/main.jsx` línea 15

### No aparecen tablas en Supabase
- ✅ Vuelve a ejecutar el script `SUPABASE_SETUP.sql`
- ✅ Verifica que no haya errores en la consola SQL

### Error al registrar usuario
- ✅ Ve a Authentication > Providers
- ✅ Asegúrate que Email esté habilitado
- ✅ Verifica que confirmaste tu email

---

## 📊 Estructura de la Base de Datos

```
profiles (usuarios)
  ├─ courses (cursos)
  │   ├─ course_modules (módulos)
  │   │   └─ course_lessons (lecciones)
  │   ├─ enrollments (inscripciones)
  │   └─ reviews (reseñas)
  │
  ├─ products (productos/servicios)
  │   └─ purchases (compras)
  │
  ├─ subscriptions (suscripciones)
  │
  ├─ blog_posts (artículos)
  │
  ├─ forum_topics (temas foro)
  │   └─ forum_replies (respuestas)
  │
  ├─ affiliates (afiliados)
  │   └─ referrals (referencias)
  │
  ├─ consultations (consultas)
  │
  ├─ notifications (notificaciones)
  │
  └─ newsletter_subscribers (boletín)
```

---

## 🎯 Funcionalidades Disponibles

### Para Usuarios (Clientes)
- ✅ Registro e inicio de sesión
- ✅ Ver y comprar cursos
- ✅ Ver y comprar productos
- ✅ Dashboard personal
- ✅ Ver progreso de cursos
- ✅ Dejar reseñas
- ✅ Participar en foro
- ✅ Sistema de afiliados

### Para Administradores
- ✅ Gestionar cursos y lecciones
- ✅ Gestionar productos
- ✅ Gestionar usuarios
- ✅ Ver ventas y estadísticas
- ✅ Gestionar blog
- ✅ Ver consultas
- ✅ Sistema de afiliados

---

## 📞 Información de Contacto en el Sitio

- **WhatsApp**: +34 654 28 16 33
- **Email**: marciguerron75@gmail.com
- **Instagram**: @soy_marcia_guerron
- **Facebook**: Marcia Iralda Guerrón Caicedo
- **Web**: www.marciaguerron.com

---

## ✨ ¡Listo!

Tu proyecto está completamente configurado y funcional. Todas las tablas, relaciones, políticas de seguridad y datos de prueba están listos para usar.

**Ejecuta `npm run dev` y comienza a trabajar** 🚀
