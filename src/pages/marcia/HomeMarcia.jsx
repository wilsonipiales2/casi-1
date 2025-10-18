import React from 'react';
import { Link } from 'react-router-dom';
import { FiArrowRight, FiBook, FiHeart, FiTrendingUp, FiStar } from 'react-icons/fi';
import { motion } from 'framer-motion';

const HomeMarcia = () => {
  const courses = [
    {
      id: 1,
      title: 'Sembrando Mentes de Riqueza',
      description: 'Más de 21 horas de clases, herramientas prácticas y acceso a comunidad de apoyo',
      price: '€47',
      normalPrice: '€97',
      hours: '21+',
      image: '/images/course-riqueza.jpg',
      features: ['21+ horas de clases', 'Herramientas prácticas', 'Comunidad de apoyo', 'Certificado']
    },
    {
      id: 2,
      title: 'Sanando Heridas de la Infancia',
      description: 'Más de 10 horas de clases para sanar y transformar tu vida desde las raíces',
      price: '€47',
      normalPrice: '€75',
      hours: '10+',
      image: '/images/course-sanacion.jpg',
      features: ['10+ horas de clases', 'Herramientas prácticas', 'Comunidad de apoyo', 'Certificado']
    }
  ];

  const features = [
    {
      icon: FiBook,
      title: 'Cursos Completos',
      description: 'Programas estructurados con horas de contenido de calidad'
    },
    {
      icon: FiHeart,
      title: 'Desarrollo Personal',
      description: 'Transforma tu vida desde el interior'
    },
    {
      icon: FiTrendingUp,
      title: 'Mentoría Financiera',
      description: 'Aprende a crear abundancia en tu vida'
    },
    {
      icon: FiStar,
      title: 'Certificación',
      description: 'Obtén certificados al completar cada curso'
    }
  ];

  const services = [
    {
      title: 'Consultas 1:1',
      description: 'Sesiones personalizadas de coaching financiero y mentoría',
      link: '/consultas',
      icon: FiHeart
    },
    {
      title: 'Servicios Profesionales',
      description: 'Asesoramiento experto en desarrollo personal y finanzas',
      link: '/servicios',
      icon: FiTrendingUp
    },
    {
      title: 'Programa de Afiliados',
      description: 'Únete a nuestro programa y gana comisiones',
      link: '/afiliados',
      icon: FiStar
    }
  ];

  const testimonials = [
    {
      name: 'Ana Martínez',
      text: 'Marcia me ayudó a transformar completamente mi relación con el dinero. Ahora vivo en abundancia.',
      rating: 5
    },
    {
      name: 'Carlos Rodríguez',
      text: 'Los cursos de Marcia son increíbles. He sanado heridas que no sabía que tenía.',
      rating: 5
    },
    {
      name: 'Laura Gómez',
      text: 'Gracias a la mentoría de Marcia, mi vida ha cambiado por completo. ¡Recomendado 100%!',
      rating: 5
    }
  ];

  return (
    <div className="min-h-screen pt-20">
      {/* Hero Section */}
      <section className="container mx-auto px-4 py-12">
        <motion.div 
          className="glass-hero text-center fade-in-up"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <h1 className="glass-hero-title mb-4">
            Despierta tu Potencial, Transforma tu Vida
          </h1>
          <p className="text-xl md:text-2xl mb-6" style={{ color: 'var(--text-secondary)' }}>
            Coach y Mentora de Finanzas | Desarrollo Personal y Espiritualidad
          </p>
          <p className="text-lg max-w-3xl mx-auto mb-8" style={{ color: 'var(--text-tertiary)' }}>
            Nuestros cursos te guían en un viaje de autodescubrimiento y crecimiento, 
            integrando el desarrollo personal, la espiritualidad y la sabiduría financiera 
            para que alcances una vida plena y abundante.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/cursos" className="glass-button-primary inline-flex items-center justify-center space-x-2 text-lg">
              <span>Ver Cursos</span>
              <FiArrowRight />
            </Link>
            <Link to="/mi-historia" className="glass-button inline-flex items-center justify-center space-x-2 text-lg">
              <span>Mi Historia</span>
            </Link>
          </div>
        </motion.div>
      </section>

      {/* Masterclass Banner */}
      <section className="container mx-auto px-4 py-8">
        <motion.div 
          className="glass-card text-center"
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.2, duration: 0.5 }}
          style={{ background: 'var(--gradient-primary)' }}
        >
          <h2 className="text-2xl md:text-3xl font-bold text-white mb-4">
            🎯 NO TE PIERDAS NUESTRA MASTERCLASS
          </h2>
          <p className="text-xl text-white mb-2">
            DERRIBANDO CREENCIAS LIMITANTES
          </p>
          <p className="text-white mb-4">AGO 19 - FALTAN 323 DÍAS</p>
          <Link to="/contacto" className="glass-button inline-block">
            MAYOR INFORMACIÓN AQUÍ
          </Link>
        </motion.div>
      </section>

      {/* Features Section */}
      <section className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {features.map((feature, index) => (
            <motion.div
              key={feature.title}
              className="glass-card glass-card-hover text-center"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.1 * index, duration: 0.5 }}
            >
              <div className="w-16 h-16 mx-auto mb-4 glass-container flex items-center justify-center">
                <feature.icon size={32} style={{ color: 'var(--accent-gold)' }} />
              </div>
              <h3 className="text-xl font-bold mb-2" style={{ color: 'var(--text-primary)' }}>
                {feature.title}
              </h3>
              <p style={{ color: 'var(--text-secondary)' }}>
                {feature.description}
              </p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* Courses Section */}
      <section className="container mx-auto px-4 py-12">
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold mb-4 text-gradient">
            Mis Cursos
          </h2>
          <p className="text-xl" style={{ color: 'var(--text-secondary)' }}>
            Programas diseñados para tu transformación personal y financiera
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-5xl mx-auto">
          {courses.map((course, index) => (
            <motion.div
              key={course.id}
              className="glass-course-card"
              initial={{ opacity: 0, x: index % 2 === 0 ? -20 : 20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.2 * index, duration: 0.6 }}
            >
              <div className="h-48 bg-gradient-to-br from-gold-200 to-gold-400 flex items-center justify-center">
                <span className="text-6xl font-bold text-white">{course.hours}</span>
              </div>
              <div className="p-6">
                <h3 className="text-2xl font-bold mb-3" style={{ color: 'var(--text-primary)' }}>
                  {course.title}
                </h3>
                <p className="mb-4" style={{ color: 'var(--text-secondary)' }}>
                  {course.description}
                </p>
                
                <div className="mb-4 space-y-2">
                  {course.features.map((feature) => (
                    <div key={feature} className="flex items-center space-x-2 text-sm" style={{ color: 'var(--text-tertiary)' }}>
                      <FiStar style={{ color: 'var(--accent-gold)' }} />
                      <span>{feature}</span>
                    </div>
                  ))}
                </div>

                <div className="flex items-center justify-between mb-4">
                  <div>
                    <span className="glass-course-price">{course.price}</span>
                    <span className="ml-3 text-sm line-through" style={{ color: 'var(--text-tertiary)' }}>
                      {course.normalPrice}
                    </span>
                  </div>
                  <span className="text-sm font-semibold" style={{ color: 'var(--accent-gold)' }}>
                    OFERTA DE LANZAMIENTO
                  </span>
                </div>

                <Link 
                  to="/cursos"
                  className="glass-button-primary w-full text-center block"
                >
                  Más Información
                </Link>
              </div>
            </motion.div>
          ))}
        </div>

        <div className="text-center mt-8">
          <Link to="/cursos" className="glass-button inline-flex items-center space-x-2">
            <span>Ver Todos los Cursos</span>
            <FiArrowRight />
          </Link>
        </div>
      </section>

      {/* Services Section */}
      <section className="container mx-auto px-4 py-12">
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold mb-4 text-gradient">
            Servicios Adicionales
          </h2>
          <p className="text-xl" style={{ color: 'var(--text-secondary)' }}>
            Descubre todas las formas en que puedo ayudarte
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mx-auto">
          {services.map((service, index) => (
            <motion.div
              key={service.title}
              className="glass-card glass-card-hover text-center"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.1 * index, duration: 0.5 }}
            >
              <div className="w-16 h-16 mx-auto mb-4 glass-container flex items-center justify-center">
                <service.icon size={32} style={{ color: 'var(--accent-gold)' }} />
              </div>
              <h3 className="text-xl font-bold mb-3" style={{ color: 'var(--text-primary)' }}>
                {service.title}
              </h3>
              <p className="mb-4" style={{ color: 'var(--text-secondary)' }}>
                {service.description}
              </p>
              <Link to={service.link} className="glass-button inline-flex items-center space-x-2">
                <span>Conocer Más</span>
                <FiArrowRight />
              </Link>
            </motion.div>
          ))}
        </div>
      </section>

      {/* Testimonials Section */}
      <section className="container mx-auto px-4 py-12" style={{ background: 'var(--gradient-overlay)' }}>
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold mb-4 text-gradient">
            Lo Que Dicen Mis Clientes
          </h2>
          <p className="text-xl" style={{ color: 'var(--text-secondary)' }}>
            Testimonios reales de personas que han transformado sus vidas
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mx-auto">
          {testimonials.map((testimonial, index) => (
            <motion.div
              key={testimonial.name}
              className="glass-card"
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: 0.1 * index, duration: 0.5 }}
            >
              <div className="flex mb-3">
                {[...Array(testimonial.rating)].map((_, i) => (
                  <FiStar key={i} style={{ color: 'var(--accent-gold)' }} fill="var(--accent-gold)" />
                ))}
              </div>
              <p className="mb-4 italic" style={{ color: 'var(--text-secondary)' }}>
                "{testimonial.text}"
              </p>
              <p className="font-bold" style={{ color: 'var(--text-primary)' }}>
                - {testimonial.name}
              </p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* Newsletter Section */}
      <section className="container mx-auto px-4 py-12">
        <motion.div 
          className="glass-card text-center max-w-2xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, duration: 0.6 }}
        >
          <h2 className="text-3xl font-bold mb-4 text-gradient">
            📧 Suscríbete al Newsletter
          </h2>
          <p className="text-lg mb-6" style={{ color: 'var(--text-secondary)' }}>
            Recibe consejos exclusivos, recursos gratuitos y ofertas especiales directamente en tu correo
          </p>
          <form className="flex flex-col sm:flex-row gap-3">
            <input
              type="email"
              placeholder="Tu correo electrónico"
              className="glass-input flex-1 px-4 py-3 rounded-lg"
              style={{ 
                background: 'var(--glass-bg)',
                border: '1px solid var(--glass-border)',
                color: 'var(--text-primary)'
              }}
            />
            <button
              type="submit"
              className="glass-button-primary px-8 py-3"
            >
              Suscribirme
            </button>
          </form>
          <p className="text-sm mt-3" style={{ color: 'var(--text-tertiary)' }}>
            No spam. Cancela en cualquier momento.
          </p>
        </motion.div>
      </section>

      {/* CTA Section */}
      <section className="container mx-auto px-4 py-12">
        <motion.div 
          className="glass-card text-center max-w-3xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.6 }}
        >
          <h2 className="text-3xl md:text-4xl font-bold mb-4 text-gradient">
            ¿Lista para Transformar tu Vida?
          </h2>
          <p className="text-lg mb-6" style={{ color: 'var(--text-secondary)' }}>
            Únete a miles de personas que ya han comenzado su viaje hacia la abundancia 
            y el crecimiento personal
          </p>
          <Link to="/contacto" className="glass-button-primary inline-block">
            Contáctame Ahora
          </Link>
        </motion.div>
      </section>
    </div>
  );
};

export default HomeMarcia;
