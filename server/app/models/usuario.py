class Usuario:
    def __init__(self, id, nombre, email, password, rol_id=None, active=True, fecha_creacion=None, fecha_modificacion=None):
        self.id = id
        self.nombre = nombre
        self.email = email
        self.password = password
        self.rol_id = rol_id
        self.active = active
        self.fecha_creacion = fecha_creacion
        self.fecha_modificacion = fecha_modificacion
        
    def __str__(self):
        return f"Usuario(id={self.id}, nombre='{self.nombre}', email='{self.email}', password='{self.password}', rol_id={self.rol_id}, active={self.active}, fecha_creacion='{self.fecha_creacion}', fecha_modificacion='{self.fecha_modificacion}')"

    def __repr__(self):
        return f"Usuario(id={self.id}, nombre='{self.nombre}', email='{self.email}', password='{self.password}', rol_id={self.rol_id}, active={self.active}, fecha_creacion='{self.fecha_creacion}', fecha_modificacion='{self.fecha_modificacion}')"
