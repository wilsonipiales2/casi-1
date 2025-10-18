import React from 'react';
import { motion } from 'framer-motion';
import { FiHeart, FiStar, FiTrendingUp } from 'react-icons/fi';

const MiHistoriaMarcia = () => {
  return (
    <div className="min-h-screen pt-20 py-12">
      {/* Hero */}
      <section className="container mx-auto px-4 mb-12">
        <motion.div
          className="glass-hero text-center"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <h1 className="text-4xl md:text-5xl font-bold mb-4 text-gradient">
            Mi Historia
          </h1>
          <p className="text-xl" style={{ color: 'var(--text-secondary)' }}>
            Un viaje de transformación, superación y propósito
          </p>
        </motion.div>
      </section>

      {/* Gratitud */}
      <section className="container mx-auto px-4 mb-12">
        <motion.div
          className="glass-card max-w-4xl mx-auto text-center"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2, duration: 0.6 }}
        >
          <h2 className="text-3xl font-bold mb-6 text-gradient">
            HOY ME SIENTO TAN AGRADECIDA POR TODO LO VIVIDO
          </h2>
          <div className="text-lg space-y-4" style={{ color: 'var(--text-secondary)' }}>
            <p>
              Soy una mujer de 52 años, emprendedora y madre de dos hijos grandes. 
              Me gusta crecer, romper las barreras, soy valiente, fuerte y me gusta ayudar a mucha gente.
            </p>
            <p>
              Soy una mujer humanitaria, honesta, humilde, con un carácter fuerte y con la fuerza 
              de voluntad necesaria para salir adelante.
            </p>
          </div>
        </motion.div>
      </section>

      {/* Filosofía */}
      <section className="container mx-auto px-4 mb-12">
        <motion.div
          className="glass-card max-w-4xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, duration: 0.6 }}
          style={{ background: 'var(--gradient-primary)' }}
        >
          <div className="text-center text-white">
            <div className="w-16 h-16 mx-auto mb-4 flex items-center justify-center"
                 style={{ background: 'rgba(255,255,255,0.2)', borderRadius: '1rem' }}>
              <FiHeart size={32} />
            </div>
            <p className="text-xl leading-relaxed">
              Durante mi recorrido, he comprendido que la clave de la felicidad y el éxito radica en 
              <strong> cultivar el amor propio</strong>, enfocarnos en nuestro interior y reconocer nuestro 
              <strong> poder creador</strong>. Cuando vivimos desde el amor y alineamos nuestra vibración 
              con la abundancia, atraemos todo lo bueno a nuestras vidas.
            </p>
          </div>
        </motion.div>
      </section>

      {/* Historia Personal */}
      <section className="container mx-auto px-4 mb-12">
        <motion.div
          className="glass-card max-w-4xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.6 }}
        >
          <h2 className="text-2xl font-bold mb-6" style={{ color: 'var(--text-primary)' }}>
            Mis Orígenes
          </h2>
          <div className="space-y-4 text-lg" style={{ color: 'var(--text-secondary)' }}>
            <p>
              Nací en un pueblito llamado <strong>El Colorado, provincia del Carchi de Ecuador</strong>. 
              Crecí en una familia de 10 hermanos, con pocos recursos y un padre con adicciones.
            </p>
            <p>
              A los 5 años, ya me encargaba de tareas domésticas como preparar café con leña. 
              A los 7 años, mi madre me dejó vivir con mi abuela, donde experimenté sucesos dolorosos, 
              incluyendo abuso sexual por parte de un sacerdote y luego por un grupo de hombres.
            </p>
            <p>
              Tras la muerte de mi abuela, regresé a vivir con mi madre, quien nunca se enteró de estos traumas.
            </p>
          </div>
        </motion.div>
      </section>

      {/* Transformación */}
      <section className="container mx-auto px-4 mb-12">
        <div className="grid md:grid-cols-3 gap-6 max-w-5xl mx-auto">
          {[
            {
              icon: FiHeart,
              title: 'Sanación',
              description: 'Transformé mi dolor en mi mayor fortaleza y aprendí a sanar desde el amor propio'
            },
            {
              icon: FiStar,
              title: 'Propósito',
              description: 'Descubrí que mi misión es ayudar a otros a transformar sus vidas y sanar sus heridas'
            },
            {
              icon: FiTrendingUp,
              title: 'Abundancia',
              description: 'Aprendí que la verdadera riqueza viene de nuestro interior y se refleja en nuestra realidad'
            }
          ].map((item, index) => (
            <motion.div
              key={item.title}
              className="glass-card text-center glass-card-hover"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.5 + (0.1 * index), duration: 0.5 }}
            >
              <div className="w-16 h-16 mx-auto mb-4 glass-container flex items-center justify-center">
                <item.icon size={32} style={{ color: 'var(--accent-gold)' }} />
              </div>
              <h3 className="text-xl font-bold mb-3" style={{ color: 'var(--text-primary)' }}>
                {item.title}
              </h3>
              <p style={{ color: 'var(--text-secondary)' }}>
                {item.description}
              </p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* Mi Misión */}
      <section className="container mx-auto px-4">
        <motion.div
          className="glass-card max-w-4xl mx-auto text-center"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.6, duration: 0.6 }}
        >
          <h2 className="text-3xl font-bold mb-6 text-gradient">
            Mi Misión Hoy
          </h2>
          <p className="text-xl mb-6" style={{ color: 'var(--text-secondary)' }}>
            Hoy dedico mi vida a ayudar a otras personas a:
          </p>
          <ul className="text-left max-w-2xl mx-auto space-y-3 text-lg" style={{ color: 'var(--text-secondary)' }}>
            <li className="flex items-start space-x-3">
              <span style={{ color: 'var(--accent-gold)' }}>✓</span>
              <span>Sanar sus heridas emocionales y del pasado</span>
            </li>
            <li className="flex items-start space-x-3">
              <span style={{ color: 'var(--accent-gold)' }}>✓</span>
              <span>Descubrir su poder interior y su capacidad de crear</span>
            </li>
            <li className="flex items-start space-x-3">
              <span style={{ color: 'var(--accent-gold)' }}>✓</span>
              <span>Desarrollar una mentalidad de abundancia y prosperidad</span>
            </li>
            <li className="flex items-start space-x-3">
              <span style={{ color: 'var(--accent-gold)' }}>✓</span>
              <span>Vivir desde el amor propio y la autenticidad</span>
            </li>
            <li className="flex items-start space-x-3">
              <span style={{ color: 'var(--accent-gold)' }}>✓</span>
              <span>Alcanzar la libertad financiera y emocional</span>
            </li>
          </ul>
        </motion.div>
      </section>
    </div>
  );
};

export default MiHistoriaMarcia;
