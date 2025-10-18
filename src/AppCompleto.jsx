import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { ThemeProvider } from './context/ThemeContext';
import { AuthProvider } from './context/AuthContext';
import { CartProvider } from './context/CartContext';
import { ModuleProvider } from './context/ModuleContext';
import { PayPalScriptProvider } from '@paypal/react-paypal-js';
import { Toaster } from 'react-hot-toast';

// Layout Components
import HeaderMarcia from './components/marcia/HeaderMarcia';
import FooterMarcia from './components/marcia/FooterMarcia';
import Navbar from './components/Navigation/Navbar';
import FullCart from './components/Cart/FullCart';
import LoadingSpinner from './components/Common/LoadingSpinner';

// Páginas Marcia (Públicas)
import HomeMarcia from './pages/marcia/HomeMarcia';
import CursosMarcia from './pages/marcia/CursosMarcia';
import MiHistoriaMarcia from './pages/marcia/MiHistoriaMarcia';
import ContactoMarcia from './pages/marcia/ContactoMarcia';

// Auth
import Login from './components/Auth/Login';
import Register from './components/Auth/Register';
import ForgotPassword from './components/Auth/ForgotPassword';
import Profile from './components/Auth/Profile';

// Cursos y Contenido
import CoursesPage from './pages/CoursesPage';
import CourseDetailPage from './pages/CourseDetailPage';
import CoursePlayerPage from './pages/CoursePlayerPage';
import MyCoursesPage from './pages/MyCoursesPage';

// E-commerce
import ProductsPage from './pages/ProductsPage';
import CheckoutPage from './pages/CheckoutPage';
import MyPurchasesPage from './pages/MyPurchasesPage';
import ThankYouPage from './pages/ThankYouPage';
import BankTransferPage from './pages/BankTransferPage';

// Dashboard Cliente
import ClientDashboard from './components/Dashboard/ClientDashboard';
import PurchaseHistory from './components/Dashboard/PurchaseHistory';
import UserProfile from './components/Dashboard/UserProfile';

// Dashboard Admin
import AdminDashboard from './components/Admin/AdminDashboard';
import AdminDashboardComplete from './components/Admin/AdminDashboardComplete';
import CourseManager from './components/Admin/CourseManager';
import ProductManager from './components/Admin/ProductManager';
import UserManager from './components/Admin/UserManager';
import BlogManager from './components/Admin/BlogManager';
import SalesManager from './components/Admin/SalesManager';

// Blog y Contenido
import BlogPage from './pages/BlogPage';
import BlogPostPage from './pages/BlogPostPage';
import ForumPage from './pages/ForumPage';

// Afiliados y Referidos
import AffiliatePage from './pages/AffiliatePage';
import ReferralsPage from './pages/ReferralsPage';

// Otras páginas
import AboutPage from './pages/AboutPage';
import ServicesPage from './pages/ServicesPage';
import ConsultationsPage from './pages/ConsultationsPage';
import SubscriptionsPage from './pages/SubscriptionsPage';
import PrivacyPolicyPage from './pages/PrivacyPolicyPage';
import TermsOfServicePage from './pages/TermsOfServicePage';

// PayPal Config
const paypalOptions = {
  'client-id': 'AWxKgr5n7ex5Lc3fDBOooaVHLgcAB-KCrYXgCmit9DpNXFIuBa6bUypYFjr-hAqARlILGxk_rRTsBZeS',
  currency: 'EUR',
  intent: 'capture',
};

function AppCompleto() {
  return (
    <AuthProvider>
      <CartProvider>
        <ModuleProvider>
          <ThemeProvider>
            <PayPalScriptProvider options={paypalOptions}>
              <div className="min-h-screen" style={{ background: 'var(--bg-primary)' }}>
                <HeaderMarcia />
                
                <main>
                  <Routes>
                    {/* Páginas Principales Marcia */}
                    <Route path="/" element={<HomeMarcia />} />
                    <Route path="/inicio" element={<HomeMarcia />} />
                    <Route path="/cursos" element={<CursosMarcia />} />
                    <Route path="/mi-historia" element={<MiHistoriaMarcia />} />
                    <Route path="/historia" element={<MiHistoriaMarcia />} />
                    <Route path="/contacto" element={<ContactoMarcia />} />
                    <Route path="/contact" element={<ContactoMarcia />} />
                    
                    {/* Auth */}
                    <Route path="/login" element={<Login />} />
                    <Route path="/register" element={<Register />} />
                    <Route path="/registro" element={<Register />} />
                    <Route path="/forgot-password" element={<ForgotPassword />} />
                    <Route path="/profile" element={<Profile />} />
                    <Route path="/perfil" element={<Profile />} />
                    
                    {/* Cursos Detallados */}
                    <Route path="/courses" element={<CoursesPage />} />
                    <Route path="/courses/:id" element={<CourseDetailPage />} />
                    <Route path="/curso/:id" element={<CourseDetailPage />} />
                    <Route path="/course/:id/play" element={<CoursePlayerPage />} />
                    <Route path="/mis-cursos" element={<MyCoursesPage />} />
                    <Route path="/my-courses" element={<MyCoursesPage />} />
                    
                    {/* E-commerce */}
                    <Route path="/productos" element={<ProductsPage />} />
                    <Route path="/products" element={<ProductsPage />} />
                    <Route path="/tienda" element={<ProductsPage />} />
                    <Route path="/checkout" element={<CheckoutPage />} />
                    <Route path="/comprar" element={<CheckoutPage />} />
                    <Route path="/mis-compras" element={<MyPurchasesPage />} />
                    <Route path="/my-purchases" element={<MyPurchasesPage />} />
                    <Route path="/thank-you" element={<ThankYouPage />} />
                    <Route path="/gracias" element={<ThankYouPage />} />
                    <Route path="/bank-transfer" element={<BankTransferPage />} />
                    <Route path="/transferencia" element={<BankTransferPage />} />
                    
                    {/* Dashboard Cliente */}
                    <Route path="/dashboard" element={<ClientDashboard />} />
                    <Route path="/mi-cuenta" element={<ClientDashboard />} />
                    <Route path="/dashboard/purchases" element={<PurchaseHistory />} />
                    <Route path="/dashboard/profile" element={<UserProfile />} />
                    
                    {/* Dashboard Admin */}
                    <Route path="/admin" element={<AdminDashboardComplete />} />
                    <Route path="/admin/dashboard" element={<AdminDashboardComplete />} />
                    <Route path="/admin/courses" element={<CourseManager />} />
                    <Route path="/admin/products" element={<ProductManager />} />
                    <Route path="/admin/users" element={<UserManager />} />
                    <Route path="/admin/blog" element={<BlogManager />} />
                    <Route path="/admin/sales" element={<SalesManager />} />
                    
                    {/* Blog */}
                    <Route path="/blog" element={<BlogPage />} />
                    <Route path="/blog/:id" element={<BlogPostPage />} />
                    
                    {/* Foro */}
                    <Route path="/foro" element={<ForumPage />} />
                    <Route path="/forum" element={<ForumPage />} />
                    <Route path="/comunidad" element={<ForumPage />} />
                    
                    {/* Afiliados */}
                    <Route path="/afiliados" element={<AffiliatePage />} />
                    <Route path="/affiliates" element={<AffiliatePage />} />
                    <Route path="/referidos" element={<ReferralsPage />} />
                    <Route path="/referrals" element={<ReferralsPage />} />
                    
                    {/* Otras páginas */}
                    <Route path="/about" element={<AboutPage />} />
                    <Route path="/sobre-mi" element={<AboutPage />} />
                    <Route path="/servicios" element={<ServicesPage />} />
                    <Route path="/services" element={<ServicesPage />} />
                    <Route path="/consultas" element={<ConsultationsPage />} />
                    <Route path="/consultations" element={<ConsultationsPage />} />
                    <Route path="/suscripciones" element={<SubscriptionsPage />} />
                    <Route path="/subscriptions" element={<SubscriptionsPage />} />
                    <Route path="/privacidad" element={<PrivacyPolicyPage />} />
                    <Route path="/privacy" element={<PrivacyPolicyPage />} />
                    <Route path="/terminos" element={<TermsOfServicePage />} />
                    <Route path="/terms" element={<TermsOfServicePage />} />
                    
                    {/* 404 */}
                    <Route path="*" element={<Navigate to="/" replace />} />
                  </Routes>
                </main>

                <FooterMarcia />

                {/* Floating Cart */}
                <FullCart />

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
            </PayPalScriptProvider>
          </ThemeProvider>
        </ModuleProvider>
      </CartProvider>
    </AuthProvider>
  );
}

export default AppCompleto;
