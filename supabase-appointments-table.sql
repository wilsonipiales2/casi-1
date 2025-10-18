-- Tabla de citas (appointments)
-- Este script crea la tabla si no existe y configura las políticas RLS

-- Crear la tabla appointments
CREATE TABLE IF NOT EXISTS appointments (
  id TEXT PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  date TIMESTAMP WITH TIME ZONE NOT NULL,
  time TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  service TEXT NOT NULL,
  notes TEXT,
  tokens_used INTEGER DEFAULT 1,
  status TEXT DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'confirmed', 'completed', 'cancelled', 'pending')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índices para mejorar el rendimiento
CREATE INDEX IF NOT EXISTS idx_appointments_user_id ON appointments(user_id);
CREATE INDEX IF NOT EXISTS idx_appointments_date ON appointments(date);
CREATE INDEX IF NOT EXISTS idx_appointments_status ON appointments(status);
CREATE INDEX IF NOT EXISTS idx_appointments_created_at ON appointments(created_at);

-- Habilitar Row Level Security (RLS)
ALTER TABLE appointments ENABLE ROW LEVEL SECURITY;

-- Política: Los usuarios pueden ver sus propias citas
CREATE POLICY "Users can view their own appointments"
  ON appointments
  FOR SELECT
  USING (auth.uid() = user_id);

-- Política: Los usuarios pueden crear sus propias citas
CREATE POLICY "Users can create their own appointments"
  ON appointments
  FOR INSERT
  WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

-- Política: Los usuarios pueden actualizar sus propias citas
CREATE POLICY "Users can update their own appointments"
  ON appointments
  FOR UPDATE
  USING (auth.uid() = user_id);

-- Política: Los usuarios pueden eliminar sus propias citas
CREATE POLICY "Users can delete their own appointments"
  ON appointments
  FOR DELETE
  USING (auth.uid() = user_id);

-- Política: Los administradores pueden ver todas las citas
CREATE POLICY "Admins can view all appointments"
  ON appointments
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'admin'
    )
  );

-- Política: Los administradores pueden actualizar todas las citas
CREATE POLICY "Admins can update all appointments"
  ON appointments
  FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'admin'
    )
  );

-- Política: Los administradores pueden eliminar todas las citas
CREATE POLICY "Admins can delete all appointments"
  ON appointments
  FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE profiles.id = auth.uid()
      AND profiles.role = 'admin'
    )
  );

-- Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para actualizar updated_at automáticamente
DROP TRIGGER IF EXISTS update_appointments_updated_at ON appointments;
CREATE TRIGGER update_appointments_updated_at
  BEFORE UPDATE ON appointments
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Comentarios para documentación
COMMENT ON TABLE appointments IS 'Tabla para gestionar las citas de los clientes';
COMMENT ON COLUMN appointments.id IS 'Identificador único de la cita (formato: CITA-xxxxx)';
COMMENT ON COLUMN appointments.user_id IS 'ID del usuario que agenda la cita (puede ser NULL para citas sin registro)';
COMMENT ON COLUMN appointments.date IS 'Fecha de la cita';
COMMENT ON COLUMN appointments.time IS 'Hora de la cita (formato: HH:mm)';
COMMENT ON COLUMN appointments.name IS 'Nombre completo del cliente';
COMMENT ON COLUMN appointments.email IS 'Correo electrónico del cliente';
COMMENT ON COLUMN appointments.phone IS 'Teléfono del cliente';
COMMENT ON COLUMN appointments.service IS 'Tipo de servicio solicitado';
COMMENT ON COLUMN appointments.notes IS 'Notas adicionales del cliente';
COMMENT ON COLUMN appointments.tokens_used IS 'Número de tokens utilizados para esta cita';
COMMENT ON COLUMN appointments.status IS 'Estado de la cita: scheduled, confirmed, completed, cancelled, pending';
