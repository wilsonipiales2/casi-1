import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { FaWhatsapp, FaInstagram, FaFacebook, FaEnvelope, FaGlobe, FaMapMarkerAlt } from 'react-icons/fa';
import { FiSend } from 'react-icons/fi';
import toast from 'react-hot-toast';

const ContactoMarcia = () => {
  const [formData, setFormData] = useState({
    nombre: '',
    email: '',
    telefono: '',
    mensaje: ''
  });

  const [isSubmitting, setIsSubmitting] = useState(false);

  const contactInfo = [
    {
      icon: FaWhatsapp,
      title: 'WhatsApp',
      value: '+34 654 28 16 33',
      link: 'https://wa.me/34654281633',
      color: '#25D366'
    },
    {
      icon: FaEnvelope,
      title: 'Email',
      value: 'marciguerron75@gmail.com',
      link: 'mailto:marciguerron75@gmail.com',
      color: '#D4AF37'
    },
    {
      icon: FaGlobe,
      title: 'Sitio Web',
      value: 'www.marciaguerron.com',
      link: 'https://www.marciaguerron.com',
      color: '#D4AF37'
    },
    {
      icon: FaInstagram,
      title: 'Instagram',
      value: '@soy_marcia_guerron',
      link: 'https://www.instagram.com/soy_marcia_guerron',
      color: '#E4405F'
    },
    {
      icon: FaFacebook,
      title: 'Facebook',
      value: 'Marcia Iralda Guerrón',
      link: 'https://www.facebook.com/marciaiarlda.guerroncaicedo',
      color: '#1877F2'
    }
  ];

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitting(true);

    try {
      // Aquí integrarías con tu backend o servicio de email
      // Por ahora simulamos el envío
      await new Promise(resolve => setTimeout(resolve, 1500));
      
      toast.success('¡Mensaje enviado con éxito! Te contactaré pronto.');
      setFormData({
        nombre: '',
        email: '',
        telefono: '',
        mensaje: ''
      });
    } catch (error) {
      toast.error('Hubo un error al enviar el mensaje. Por favor intenta de nuevo.');
    } finally {
      setIsSubmitting(false);
    }
  };

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
            Conectemos
          </h1>
          <p className="text-xl" style={{ color: 'var(--text-secondary)' }}>
            Estoy aquí para ayudarte en tu viaje de transformación
          </p>
        </motion.div>
      </section>

      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 max-w-6xl mx-auto">
          {/* Contact Info */}
          <motion.div
            initial={{ opacity: 0, x: -30 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.2, duration: 0.6 }}
          >
            <div className="glass-card mb-8">
              <h2 className="text-2xl font-bold mb-6" style={{ color: 'var(--text-primary)' }}>
                Información de Contacto
              </h2>
              <div className="space-y-4">
                {contactInfo.map((item, index) => (
                  <a
                    key={index}
                    href={item.link}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="glass-container p-4 flex items-center space-x-4 smooth-transition hover:scale-105"
                  >
                    <div className="w-12 h-12 flex items-center justify-center rounded-lg"
                         style={{ background: `${item.color}20` }}>
                      <item.icon size={24} style={{ color: item.color }} />
                    </div>
                    <div>
                      <div className="font-semibold" style={{ color: 'var(--text-primary)' }}>
                        {item.title}
                      </div>
                      <div className="text-sm" style={{ color: 'var(--text-secondary)' }}>
                        {item.value}
                      </div>
                    </div>
                  </a>
                ))}
              </div>
            </div>

            {/* Quick Contact */}
            <motion.div
              className="glass-card text-center"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4, duration: 0.6 }}
              style={{ background: 'var(--gradient-primary)' }}
            >
              <FaWhatsapp size={48} className="mx-auto mb-4 text-white" />
              <h3 className="text-xl font-bold text-white mb-3">
                ¿Necesitas ayuda inmediata?
              </h3>
              <p className="text-white mb-4 opacity-90">
                Contáctame directamente por WhatsApp
              </p>
              <a
                href="https://wa.me/34654281633"
                target="_blank"
                rel="noopener noreferrer"
                className="glass-button inline-block"
              >
                Abrir WhatsApp
              </a>
            </motion.div>
          </motion.div>

          {/* Contact Form */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.3, duration: 0.6 }}
          >
            <div className="glass-card">
              <h2 className="text-2xl font-bold mb-6" style={{ color: 'var(--text-primary)' }}>
                Envíame un Mensaje
              </h2>
              <form onSubmit={handleSubmit} className="space-y-6">
                <div>
                  <label htmlFor="nombre" className="block mb-2 font-medium" style={{ color: 'var(--text-primary)' }}>
                    Nombre Completo *
                  </label>
                  <input
                    type="text"
                    id="nombre"
                    name="nombre"
                    value={formData.nombre}
                    onChange={handleChange}
                    required
                    className="glass-input"
                    placeholder="Tu nombre"
                  />
                </div>

                <div>
                  <label htmlFor="email" className="block mb-2 font-medium" style={{ color: 'var(--text-primary)' }}>
                    Email *
                  </label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    required
                    className="glass-input"
                    placeholder="tu@email.com"
                  />
                </div>

                <div>
                  <label htmlFor="telefono" className="block mb-2 font-medium" style={{ color: 'var(--text-primary)' }}>
                    Teléfono
                  </label>
                  <input
                    type="tel"
                    id="telefono"
                    name="telefono"
                    value={formData.telefono}
                    onChange={handleChange}
                    className="glass-input"
                    placeholder="+34 XXX XXX XXX"
                  />
                </div>

                <div>
                  <label htmlFor="mensaje" className="block mb-2 font-medium" style={{ color: 'var(--text-primary)' }}>
                    Mensaje *
                  </label>
                  <textarea
                    id="mensaje"
                    name="mensaje"
                    value={formData.mensaje}
                    onChange={handleChange}
                    required
                    rows="5"
                    className="glass-input resize-none"
                    placeholder="Cuéntame cómo puedo ayudarte..."
                  />
                </div>

                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="glass-button-primary w-full flex items-center justify-center space-x-2 text-lg"
                >
                  {isSubmitting ? (
                    <span>Enviando...</span>
                  ) : (
                    <>
                      <span>Enviar Mensaje</span>
                      <FiSend />
                    </>
                  )}
                </button>
              </form>
            </div>
          </motion.div>
        </div>
      </div>

      {/* Map or Additional Info */}
      <section className="container mx-auto px-4 mt-12">
        <motion.div
          className="glass-card text-center max-w-3xl mx-auto"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, duration: 0.6 }}
        >
          <h2 className="text-2xl font-bold mb-4" style={{ color: 'var(--text-primary)' }}>
            Horario de Atención
          </h2>
          <p className="text-lg" style={{ color: 'var(--text-secondary)' }}>
            Lunes a Viernes: 9:00 AM - 6:00 PM (Hora de España)<br />
            Respondo mensajes en menos de 24 horas
          </p>
        </motion.div>
      </section>
    </div>
  );
};

export default ContactoMarcia;
