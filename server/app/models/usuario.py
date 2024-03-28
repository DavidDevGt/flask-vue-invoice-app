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
