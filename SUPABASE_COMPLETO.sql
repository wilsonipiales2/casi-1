-- ============================================================================
-- MARCIA GUERRÓN - COACH Y MENTORA DE FINANZAS
-- BASE DE DATOS COMPLETA CON TODOS LOS PRODUCTOS Y SERVICIOS
-- ============================================================================
-- INSTRUCCIONES: 
-- 1. Ve a https://supabase.com/dashboard
-- 2. Abre tu proyecto
-- 3. Ve a SQL Editor > New Query
-- 4. COPIA TODO ESTE ARCHIVO y PÉGALO
-- 5. Clic en RUN
-- ============================================================================

-- Habilitar extensiones
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================================
-- TABLAS PRINCIPALES
-- ============================================================================

-- Perfiles de usuarios
CREATE TABLE IF NOT EXISTS profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT UNIQUE NOT NULL,
    full_name TEXT,
    avatar_url TEXT,
    phone TEXT,
    bio TEXT,
    role TEXT DEFAULT 'client' CHECK (role IN ('client', 'admin', 'coach')),
    subscription_tier TEXT DEFAULT 'free' CHECK (subscription_tier IN ('free', 'basic', 'premium', 'vip')),
    credits INTEGER DEFAULT 0,
    affiliate_code TEXT UNIQUE,
    referrer_id UUID REFERENCES profiles(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Cursos
CREATE TABLE IF NOT EXISTS courses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    description TEXT,
    long_description TEXT,
    thumbnail_url TEXT,
    instructor_id UUID REFERENCES profiles(id),
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    original_price DECIMAL(10,2),
    currency TEXT DEFAULT 'EUR',
    level TEXT CHECK (level IN ('beginner', 'intermediate', 'advanced')),
    duration_hours INTEGER,
    category TEXT,
    tags TEXT[],
    is_published BOOLEAN DEFAULT false,
    is_featured BOOLEAN DEFAULT false,
    enrollment_count INTEGER DEFAULT 0,
    rating DECIMAL(3,2) DEFAULT 0,
    review_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Módulos de cursos
CREATE TABLE IF NOT EXISTS course_modules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    order_index INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Lecciones
CREATE TABLE IF NOT EXISTS course_lessons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    module_id UUID REFERENCES course_modules(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    content TEXT,
    video_url TEXT,
    duration_minutes INTEGER,
    order_index INTEGER NOT NULL,
    is_free BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Inscripciones
CREATE TABLE IF NOT EXISTS enrollments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
    enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    completed_at TIMESTAMP WITH TIME ZONE,
    progress_percentage INTEGER DEFAULT 0,
    last_accessed_at TIMESTAMP WITH TIME ZONE,
    UNIQUE(user_id, course_id)
);

-- Progreso de lecciones
CREATE TABLE IF NOT EXISTS lesson_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    lesson_id UUID REFERENCES course_lessons(id) ON DELETE CASCADE,
    is_completed BOOLEAN DEFAULT false,
    completed_at TIMESTAMP WITH TIME ZONE,
    time_spent_minutes INTEGER DEFAULT 0,
    UNIQUE(user_id, lesson_id)
);

-- Productos y servicios
CREATE TABLE IF NOT EXISTS products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    description TEXT,
    long_description TEXT,
    image_url TEXT,
    price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2),
    currency TEXT DEFAULT 'EUR',
    category TEXT,
    type TEXT CHECK (type IN ('course', 'ebook', 'consultation', 'masterclass', 'subscription', 'service', 'webinar')),
    is_active BOOLEAN DEFAULT true,
    is_featured BOOLEAN DEFAULT false,
    stock_quantity INTEGER,
    digital_product BOOLEAN DEFAULT true,
    download_url TEXT,
    duration_minutes INTEGER,
    features TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Compras
CREATE TABLE IF NOT EXISTS purchases (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id),
    course_id UUID REFERENCES courses(id),
    amount DECIMAL(10,2) NOT NULL,
    currency TEXT DEFAULT 'EUR',
    payment_method TEXT,
    payment_status TEXT DEFAULT 'pending' CHECK (payment_status IN ('pending', 'completed', 'failed', 'refunded')),
    transaction_id TEXT,
    invoice_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Suscripciones
CREATE TABLE IF NOT EXISTS subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    plan_name TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    billing_cycle TEXT CHECK (billing_cycle IN ('monthly', 'yearly')),
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'cancelled', 'expired', 'paused')),
    current_period_start TIMESTAMP WITH TIME ZONE,
    current_period_end TIMESTAMP WITH TIME ZONE,
    cancel_at_period_end BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Blog
CREATE TABLE IF NOT EXISTS blog_posts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    author_id UUID REFERENCES profiles(id),
    title TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    excerpt TEXT,
    content TEXT NOT NULL,
    featured_image TEXT,
    category TEXT,
    tags TEXT[],
    is_published BOOLEAN DEFAULT false,
    published_at TIMESTAMP WITH TIME ZONE,
    views_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Foro
CREATE TABLE IF NOT EXISTS forum_topics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    content TEXT NOT NULL,
    category TEXT,
    is_pinned BOOLEAN DEFAULT false,
    is_locked BOOLEAN DEFAULT false,
    views_count INTEGER DEFAULT 0,
    replies_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS forum_replies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    topic_id UUID REFERENCES forum_topics(id) ON DELETE CASCADE,
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    is_solution BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Afiliados
CREATE TABLE IF NOT EXISTS affiliates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    affiliate_code TEXT UNIQUE NOT NULL,
    commission_rate DECIMAL(5,2) DEFAULT 10.00,
    total_referrals INTEGER DEFAULT 0,
    total_earnings DECIMAL(10,2) DEFAULT 0,
    pending_earnings DECIMAL(10,2) DEFAULT 0,
    paid_earnings DECIMAL(10,2) DEFAULT 0,
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'suspended')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS referrals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    affiliate_id UUID REFERENCES affiliates(id) ON DELETE CASCADE,
    referred_user_id UUID REFERENCES profiles(id),
    purchase_id UUID REFERENCES purchases(id),
    commission_amount DECIMAL(10,2) DEFAULT 0,
    commission_status TEXT DEFAULT 'pending' CHECK (commission_status IN ('pending', 'approved', 'paid')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Consultas
CREATE TABLE IF NOT EXISTS consultations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    type TEXT CHECK (type IN ('general', 'financial', 'personal', 'business')),
    title TEXT NOT NULL,
    description TEXT,
    scheduled_at TIMESTAMP WITH TIME ZONE,
    duration_minutes INTEGER DEFAULT 60,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
    meeting_url TEXT,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Newsletter
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT UNIQUE NOT NULL,
    full_name TEXT,
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'unsubscribed')),
    subscribed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    unsubscribed_at TIMESTAMP WITH TIME ZONE
);

-- Reseñas
CREATE TABLE IF NOT EXISTS reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    is_approved BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id, course_id)
);

-- Notificaciones
CREATE TABLE IF NOT EXISTS notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    message TEXT,
    type TEXT,
    is_read BOOLEAN DEFAULT false,
    action_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================================================
-- ÍNDICES
-- ============================================================================
CREATE INDEX IF NOT EXISTS idx_profiles_email ON profiles(email);
CREATE INDEX IF NOT EXISTS idx_profiles_affiliate_code ON profiles(affiliate_code);
CREATE INDEX IF NOT EXISTS idx_courses_slug ON courses(slug);
CREATE INDEX IF NOT EXISTS idx_courses_is_published ON courses(is_published);
CREATE INDEX IF NOT EXISTS idx_enrollments_user_id ON enrollments(user_id);
CREATE INDEX IF NOT EXISTS idx_enrollments_course_id ON enrollments(course_id);
CREATE INDEX IF NOT EXISTS idx_purchases_user_id ON purchases(user_id);
CREATE INDEX IF NOT EXISTS idx_blog_posts_slug ON blog_posts(slug);
CREATE INDEX IF NOT EXISTS idx_forum_topics_slug ON forum_topics(slug);
CREATE INDEX IF NOT EXISTS idx_affiliates_code ON affiliates(affiliate_code);

-- ============================================================================
-- TRIGGERS
-- ============================================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_courses_updated_at BEFORE UPDATE ON courses
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_purchases_updated_at BEFORE UPDATE ON purchases
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================================
-- POLÍTICAS RLS
-- ============================================================================
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE purchases ENABLE ROW LEVEL SECURITY;
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own profile" ON profiles
    FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update their own profile" ON profiles
    FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Anyone can view published courses" ON courses
    FOR SELECT USING (is_published = true);
CREATE POLICY "Users can view their enrollments" ON enrollments
    FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can view their purchases" ON purchases
    FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Anyone can view published blog posts" ON blog_posts
    FOR SELECT USING (is_published = true);

-- ============================================================================
-- DATOS: CURSOS COMPLETOS DE MARCIA GUERRÓN
-- ============================================================================
INSERT INTO courses (title, slug, description, long_description, price, original_price, level, category, is_published, is_featured, duration_hours) VALUES
('Sembrando Mentes de Riqueza', 'sembrando-mentes-riqueza', 
'Transforma tu mentalidad financiera y alcanza la abundancia que mereces',
'Este programa completo te guiará en un viaje transformador hacia la prosperidad. Aprenderás a identificar y eliminar creencias limitantes sobre el dinero, desarrollar una mentalidad de abundancia, y crear estrategias prácticas para alcanzar tus metas financieras. Incluye ejercicios de reflexión, meditaciones guiadas y herramientas de trabajo personal.',
47.00, 97.00, 'beginner', 'Desarrollo Personal', true, true, 12),

('Sanando Heridas de la Infancia', 'sanando-heridas-infancia',
'Proceso terapéutico para sanar traumas y creencias limitantes desde la raíz',
'Un viaje profundo de sanación emocional donde exploraremos las experiencias de tu infancia que han moldeado tus creencias sobre ti mismo, el dinero y las relaciones. A través de técnicas de PNL, terapia regresiva y trabajo interno, liberarás patrones dolorosos y construirás una nueva narrativa de empoderamiento y bienestar.',
47.00, 97.00, 'intermediate', 'Sanación Emocional', true, true, 15),

('Integración en Pareja', 'integracion-pareja',
'Fortalece tu relación y construye una pareja próspera y equilibrada',
'Aprende a crear una relación de pareja basada en la comunicación auténtica, el respeto mutuo y la prosperidad compartida. Este curso te enseñará técnicas para resolver conflictos, alinear objetivos financieros con tu pareja, y construir juntos una vida de abundancia y felicidad.',
47.00, 97.00, 'intermediate', 'Relaciones', true, false, 10),

('Masterclass: Mentalidad Millonaria', 'masterclass-mentalidad-millonaria',
'Descubre los secretos de la mentalidad millonaria en esta masterclass exclusiva',
'En esta masterclass de 2 horas aprenderás los principios fundamentales que diferencian a las personas prósperas de las que viven en escasez. Descubrirás cómo pensar como los millonarios, tomar decisiones financieras inteligentes y crear un plan de acción para tu libertad financiera.',
0.00, 27.00, 'beginner', 'Masterclass', true, true, 2),

('Finanzas Personales para Emprendedores', 'finanzas-personales-emprendedores',
'Domina tus finanzas y construye un negocio próspero',
'Curso completo de finanzas personales diseñado especialmente para emprendedores. Aprenderás a gestionar el flujo de caja de tu negocio, separar finanzas personales y empresariales, crear presupuestos efectivos, y estrategias de inversión para hacer crecer tu patrimonio.',
67.00, 147.00, 'advanced', 'Emprendimiento', true, true, 20);

-- ============================================================================
-- DATOS: PRODUCTOS Y SERVICIOS
-- ============================================================================
INSERT INTO products (name, slug, description, long_description, price, original_price, type, is_active, is_featured, duration_minutes, features) VALUES

-- Consultas
('Consulta Individual 1:1', 'consulta-individual',
'Sesión personalizada de coaching financiero y mentoría',
'Una hora completa de atención personalizada donde trabajaremos juntas en tus objetivos financieros, desafíos emocionales y estrategias de crecimiento personal. Incluye análisis de situación actual, plan de acción personalizado y seguimiento por email durante 7 días.',
97.00, 147.00, 'consultation', true, true, 60,
ARRAY['1 hora de sesión privada', 'Análisis personalizado', 'Plan de acción', 'Seguimiento 7 días', 'Grabación de la sesión']),

('Paquete 3 Sesiones de Coaching', 'paquete-3-sesiones',
'Tres sesiones de coaching con seguimiento continuo',
'Paquete intensivo de tres sesiones de coaching distribuidas en un mes. Ideal para trabajar objetivos específicos con seguimiento y apoyo continuo. Incluye ejercicios personalizados entre sesiones y acceso a grupo privado de Telegram.',
247.00, 397.00, 'consultation', true, true, 180,
ARRAY['3 sesiones de 1 hora', 'Plan personalizado', 'Ejercicios semanales', 'Grupo privado Telegram', 'Material complementario']),

('Mentoría VIP 3 Meses', 'mentoria-vip-3-meses',
'Programa de mentoría intensiva con acompañamiento completo',
'El programa más completo: 12 sesiones individuales durante 3 meses, acceso ilimitado por WhatsApp, revisión de avances semanales, y acceso a todos mis cursos. Perfecto para transformaciones profundas y resultados sostenibles.',
997.00, 1997.00, 'service', true, true, 720,
ARRAY['12 sesiones 1:1', 'WhatsApp ilimitado', 'Acceso a todos los cursos', 'Revisión semanal', 'Certificado', 'Bonos exclusivos']),

-- E-books
('E-book: Las 7 Leyes de la Abundancia', 'ebook-7-leyes-abundancia',
'Guía práctica para atraer prosperidad a tu vida',
'Descarga inmediata de este e-book de 120 páginas donde comparto las 7 leyes fundamentales que transformarán tu relación con el dinero. Incluye ejercicios prácticos, afirmaciones y plan de 30 días para implementar cada ley.',
17.00, 37.00, 'ebook', true, true, 0,
ARRAY['120 páginas', 'Ejercicios prácticos', 'Plan 30 días', 'Descarga inmediata', 'Formato PDF']),

('E-book: Sanación Financiera', 'ebook-sanacion-financiera',
'Libera tus bloqueos con el dinero',
'E-book especializado en identificar y sanar las heridas emocionales que te impiden prosperar. Con técnicas de PNL, tapping y trabajo con el niño interior aplicadas al ámbito financiero.',
17.00, 37.00, 'ebook', true, false, 0,
ARRAY['95 páginas', 'Técnicas de sanación', 'Casos de estudio', 'Audio meditaciones', 'Formato PDF + Audio']),

-- Masterclass
('Masterclass: De la Escasez a la Abundancia', 'masterclass-escasez-abundancia',
'Webinar en vivo sobre transformación financiera',
'Únete a esta poderosa masterclass en vivo donde revelaré las estrategias exactas que uso con mis clientes para pasar de la mentalidad de escasez a la abundancia. Incluye sesión de preguntas y respuestas en vivo.',
27.00, 47.00, 'masterclass', true, true, 120,
ARRAY['2 horas en vivo', 'Sesión Q&A', 'Material descargable', 'Replay disponible', 'Certificado de asistencia']),

-- Webinar
('Webinar: Estrategias de Inversión para Mujeres', 'webinar-inversion-mujeres',
'Aprende a invertir con confianza y seguridad',
'Webinar especializado donde aprenderás los fundamentos de la inversión, diferentes vehículos de inversión, y cómo crear tu primer portafolio de inversiones. Especialmente diseñado para mujeres que quieren tomar control de su futuro financiero.',
37.00, 67.00, 'webinar', true, false, 90,
ARRAY['90 minutos', 'Plantillas incluidas', 'Guía de inversión', 'Recursos adicionales', 'Grupo de apoyo']),

-- Suscripciones
('Membresía Círculo de Abundancia', 'membresia-circulo-abundancia',
'Comunidad privada con acceso a contenido exclusivo mensual',
'Únete a nuestra comunidad exclusiva y recibe cada mes: 1 masterclass en vivo, acceso a biblioteca de recursos, grupo privado, sesiones grupales de coaching, y descuentos especiales en todos nuestros servicios.',
27.00, 47.00, 'subscription', true, true, 0,
ARRAY['Masterclass mensual', 'Biblioteca recursos', 'Grupo privado', 'Sesiones grupales', 'Descuentos especiales']),

-- Servicios adicionales
('Análisis Numerológico Financiero', 'analisis-numerologico',
'Descubre tu código de prosperidad personal',
'Análisis completo de tu numerología aplicada a las finanzas. Descubre tus números de poder, ciclos de abundancia, y cómo alinearte con la energía del dinero según tu fecha de nacimiento. Incluye informe detallado y sesión de 30 minutos.',
77.00, 127.00, 'service', true, false, 30,
ARRAY['Análisis numerológico', 'Informe personalizado', 'Sesión 30 min', 'Guía de implementación', 'PDF descargable']),

('Taller Presencial: Día de Transformación', 'taller-dia-transformacion',
'Taller intensivo de un día completo',
'Experiencia transformadora de 8 horas donde trabajaremos en profundidad tus creencias sobre el dinero, relaciones y propósito de vida. Incluye almuerzo, materiales, certificado y seguimiento post-taller.',
297.00, 497.00, 'service', true, true, 480,
ARRAY['8 horas presencial', 'Almuerzo incluido', 'Materiales', 'Certificado', 'Seguimiento 15 días', 'Foto grupo']);

-- ============================================================================
-- DATOS: ARTÍCULOS DE BLOG
-- ============================================================================
INSERT INTO blog_posts (title, slug, excerpt, content, category, is_published, published_at) VALUES
('5 Creencias que te Impiden Ser Rico', '5-creencias-impiden-ser-rico',
'Descubre las creencias limitantes más comunes sobre el dinero y cómo superarlas',
'Contenido completo del artículo sobre las 5 creencias limitantes más comunes: el dinero es malo, los ricos son codiciosos, no merezco abundancia, el dinero me cambiará negativamente, y la prosperidad es para otros. Cada sección incluye ejercicios para identificar y transformar estas creencias.',
'Finanzas', true, NOW() - INTERVAL '10 days'),

('Cómo Sanar tu Relación con el Dinero', 'sanar-relacion-dinero',
'Pasos prácticos para transformar tu vínculo emocional con las finanzas',
'Artículo profundo sobre la relación emocional con el dinero, incluyendo ejercicios de journaling, meditaciones y técnicas de PNL para reprogramar tu subconsciente financiero.',
'Desarrollo Personal', true, NOW() - INTERVAL '15 days'),

('El Poder de la Mentalidad de Abundancia', 'poder-mentalidad-abundancia',
'Por qué pensar en abundancia cambia tu realidad financiera',
'Exploración científica y espiritual sobre cómo la mentalidad de abundancia atrae oportunidades, mejora decisiones y crea prosperidad sostenible.',
'Mindset', true, NOW() - INTERVAL '20 days');

-- ============================================================================
-- ¡LISTO! TODO CONFIGURADO
-- ============================================================================
-- Ahora puedes:
-- 1. Registrar usuarios en tu aplicación
-- 2. Ver los cursos en /cursos
-- 3. Ver productos en /productos
-- 4. Comprar cursos y productos
-- 5. Usar el dashboard de admin (cambia role a 'admin' en profiles)
-- ============================================================================
