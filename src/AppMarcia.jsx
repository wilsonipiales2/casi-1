import React from 'react';
import { Routes, Route } from 'react-router-dom';
import { ThemeProvider } from './context/ThemeContext';
import { Toaster } from 'react-hot-toast';

// Componentes de Marcia
import HeaderMarcia from './components/marcia/HeaderMarcia';
import FooterMarcia from './components/marcia/FooterMarcia';

// Páginas de Marcia
import HomeMarcia from './pages/marcia/HomeMarcia';
import CursosMarcia from './pages/marcia/CursosMarcia';
import MiHistoriaMarcia from './pages/marcia/MiHistoriaMarcia';
import ContactoMarcia from './pages/marcia/ContactoMarcia';

function AppMarcia() {
  return (
    <ThemeProvider>
      <div className="min-h-screen" style={{ background: 'var(--bg-primary)' }}>
        <HeaderMarcia />
        
        <main>
          <Routes>
            <Route path="/" element={<HomeMarcia />} />
            <Route path="/cursos" element={<CursosMarcia />} />
            <Route path="/mi-historia" element={<MiHistoriaMarcia />} />
            <Route path="/contacto" element={<ContactoMarcia />} />
            
            {/* Redirecciones alternativas */}
            <Route path="/courses" element={<CursosMarcia />} />
            <Route path="/about" element={<MiHistoriaMarcia />} />
            <Route path="/contact" element={<ContactoMarcia />} />
            
            {/* 404 - Redireccionar a home */}
            <Route path="*" element={<HomeMarcia />} />
          </Routes>
        </main>

        <FooterMarcia />

        {/* Toast Notifications */}
        <Toaster
          position="top-right"
          toastOptions={{
            duration: 4000,
            style: {
              background: 'var(--glass-bg)',
              backdropFilter: 'blur(10px)',
              color: 'var(--text-primary)',
              border: '1px solid var(--glass-border)',
            },
            success: {
              duration: 3000,
              iconTheme: {
                primary: 'var(--accent-gold)',
                secondary: '#fff',
              },
            },
            error: {
              duration: 5000,
              iconTheme: {
                primary: '#ef4444',
                secondary: '#fff',
              },
            },
          }}
        />
      </div>
    </ThemeProvider>
  );
}

export default AppMarcia;
