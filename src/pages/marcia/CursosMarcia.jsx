import React from 'react';
import { Link } from 'react-router-dom';
import { FiClock, FiUsers, FiAward, FiCheckCircle } from 'react-icons/fi';
import { motion } from 'framer-motion';

const CursosMarcia = () => {
  const courses = [
    {
      id: 1,
      title: 'Sembrando Mentes de Riqueza',
      description: 'Transforma tu mentalidad financiera y aprende a crear abundancia verdadera en tu vida. Este curso te enseñará a reprogramar tus creencias limitantes sobre el dinero y desarrollar una mentalidad de prosperidad.',
      price: '€47',
      normalPrice: '€97',
      hours: '21+',
      students: '500+',
      rating: 4.9,
      features: [
        'Más de 21 horas de contenido en video',
        'Herramientas prácticas descargables',
        'Acceso a comunidad privada',
        'Certificado de participación',
        'Sesiones de Q&A en vivo',
        'Acceso de por vida',
        'Actualizaciones gratuitas'
      ],
      modules: [
        'Fundamentos de la mentalidad de riqueza',
        'Identificando y eliminando creencias limitantes',
        'Creando sistemas de abundancia',
        'Inversión y gestión financiera',
        'Atrayendo oportunidades',
        'Manteniendo la prosperidad'
      ]
    },
    {
      id: 2,
      title: 'Sanando Heridas de la Infancia',
      description: 'Un viaje profundo de sanación emocional donde aprenderás a identificar, sanar y transformar las heridas de tu pasado que te impiden vivir plenamente en el presente.',
      price: '€47',
      normalPrice: '€75',
      hours: '10+',
      students: '350+',
      rating: 5.0,
      features: [
        'Más de 10 horas de clases',
        'Ejercicios de sanación guiados',
        'Meditaciones grabadas',
        'Comunidad de apoyo',
        'Certificado de participación',
        'Material complementario',
        'Soporte continuo'
      ],
      modules: [
        'Reconociendo las heridas emocionales',
        'El niño interior',
        'Patrones de comportamiento',
        'Técnicas de sanación',
        'Perdón y liberación',
        'Reconstruyendo tu identidad'
      ]
    },
    {
      id: 3,
      title: 'Integración y Crecimiento en Pareja',
      description: 'PRÓXIMAMENTE - Un programa diseñado para ayudar a las parejas a encontrar un propósito compartido y construir una relación más profunda y significativa.',
      price: 'Próximamente',
      normalPrice: '',
      hours: '15+',
      students: 'Nuevo',
      rating: 0,
      features: [
        'Comunicación efectiva en pareja',
        'Resolución de conflictos',
        'Construcción de intimidad emocional',
        'Metas compartidas',
        'Finanzas en pareja',
        'Ejercicios prácticos para dos',
        'Sesiones de coaching incluidas'
      ],
      modules: [
        'Fundamentos de relaciones saludables',
        'Comunicación consciente',
        'Manejo de conflictos',
        'Intimidad y conexión',
        'Proyectos de vida compartidos',
        'Crecimiento conjunto'
      ],
      comingSoon: true
    }
  ];

  return (
    <div className="min-h-screen py-12">
      {/* Header */}
      <section className="container mx-auto px-4 mb-12">
        <motion.div
          className="glass-hero text-center"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <h1 className="text-4xl md:text-5xl font-bold mb-4 text-gradient">
            Mis Cursos de Transformación
          </h1>
          <p className="text-xl" style={{ color: 'var(--text-secondary)' }}>
            Programas diseñados para tu desarrollo personal, emocional y financiero
          </p>
        </motion.div>
      </section>

      {/* Courses Grid */}
      <section className="container mx-auto px-4">
        <div className="space-y-12">
          {courses.map((course, index) => (
            <motion.div
              key={course.id}
              className={`glass-card glass-card-hover ${course.comingSoon ? 'opacity-75' : ''}`}
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.1 * index, duration: 0.6 }}
            >
              <div className="grid md:grid-cols-2 gap-8">
                {/* Left Column - Info */}
                <div>
                  {course.comingSoon && (
                    <span className="inline-block mb-2 px-3 py-1 rounded-full text-sm font-semibold"
                          style={{ background: 'var(--accent-gold)', color: 'white' }}>
                      PRÓXIMAMENTE
                    </span>
                  )}
                  <h2 className="text-3xl font-bold mb-4" style={{ color: 'var(--text-primary)' }}>
                    {course.title}
                  </h2>
                  <p className="text-lg mb-6" style={{ color: 'var(--text-secondary)' }}>
                    {course.description}
                  </p>

                  {/* Stats */}
                  <div className="grid grid-cols-3 gap-4 mb-6">
                    <div className="text-center glass-container p-3">
                      <FiClock size={24} className="mx-auto mb-2" style={{ color: 'var(--accent-gold)' }} />
                      <div className="font-bold" style={{ color: 'var(--text-primary)' }}>{course.hours}</div>
                      <div className="text-xs" style={{ color: 'var(--text-tertiary)' }}>Horas</div>
                    </div>
                    <div className="text-center glass-container p-3">
                      <FiUsers size={24} className="mx-auto mb-2" style={{ color: 'var(--accent-gold)' }} />
                      <div className="font-bold" style={{ color: 'var(--text-primary)' }}>{course.students}</div>
                      <div className="text-xs" style={{ color: 'var(--text-tertiary)' }}>Estudiantes</div>
                    </div>
                    <div className="text-center glass-container p-3">
                      <FiAward size={24} className="mx-auto mb-2" style={{ color: 'var(--accent-gold)' }} />
                      <div className="font-bold" style={{ color: 'var(--text-primary)' }}>{course.rating || 'Nuevo'}</div>
                      <div className="text-xs" style={{ color: 'var(--text-tertiary)' }}>Rating</div>
                    </div>
                  </div>

                  {/* Modules */}
                  <div className="mb-6">
                    <h3 className="text-xl font-bold mb-3" style={{ color: 'var(--text-primary)' }}>
                      Módulos del Curso
                    </h3>
                    <div className="space-y-2">
                      {course.modules.map((module, idx) => (
                        <div key={idx} className="flex items-start space-x-2">
                          <FiCheckCircle className="mt-1 flex-shrink-0" style={{ color: 'var(--accent-gold)' }} />
                          <span style={{ color: 'var(--text-secondary)' }}>{module}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>

                {/* Right Column - Features & Price */}
                <div>
                  <div className="glass-container p-6 mb-6">
                    <h3 className="text-xl font-bold mb-4" style={{ color: 'var(--text-primary)' }}>
                      ¿Qué Incluye?
                    </h3>
                    <ul className="space-y-3">
                      {course.features.map((feature, idx) => (
                        <li key={idx} className="flex items-start space-x-2">
                          <FiCheckCircle className="mt-1 flex-shrink-0" style={{ color: 'var(--accent-gold)' }} />
                          <span style={{ color: 'var(--text-secondary)' }}>{feature}</span>
                        </li>
                      ))}
                    </ul>
                  </div>

                  {!course.comingSoon && (
                    <div className="glass-container p-6">
                      <div className="text-center mb-4">
                        <div className="text-sm font-semibold mb-2" style={{ color: 'var(--accent-gold)' }}>
                          PRECIO DE LANZAMIENTO
                        </div>
                        <div className="flex items-center justify-center space-x-3">
                          <span className="text-4xl font-bold" style={{ color: 'var(--text-primary)' }}>
                            {course.price}
                          </span>
                          {course.normalPrice && (
                            <span className="text-xl line-through" style={{ color: 'var(--text-tertiary)' }}>
                              {course.normalPrice}
                            </span>
                          )}
                        </div>
                        <div className="text-sm mt-2" style={{ color: 'var(--text-tertiary)' }}>
                          + IMP
                        </div>
                      </div>
                      <Link 
                        to={`/curso/${course.id}`}
                        className="glass-button-primary w-full text-center block text-lg"
                      >
                        Inscribirme Ahora
                      </Link>
                    </div>
                  )}

                  {course.comingSoon && (
                    <div className="glass-container p-6 text-center">
                      <p className="mb-4" style={{ color: 'var(--text-secondary)' }}>
                        Este curso estará disponible pronto. Déjanos tu email para notificarte.
                      </p>
                      <Link 
                        to="/contacto"
                        className="glass-button w-full text-center block"
                      >
                        Notificarme
                      </Link>
                    </div>
                  )}
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </section>

      {/* CTA Section */}
      <section className="container mx-auto px-4 mt-12">
        <motion.div
          className="glass-card text-center max-w-2xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.6 }}
        >
          <h2 className="text-2xl font-bold mb-4 text-gradient">
            ¿Tienes Preguntas?
          </h2>
          <p className="mb-6" style={{ color: 'var(--text-secondary)' }}>
            Estoy aquí para ayudarte a elegir el curso perfecto para tu transformación
          </p>
          <Link to="/contacto" className="glass-button-primary inline-block">
            Contáctame
          </Link>
        </motion.div>
      </section>
    </div>
  );
};

export default CursosMarcia;
