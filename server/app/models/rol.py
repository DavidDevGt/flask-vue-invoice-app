class Rol:
    def __init__(self, id, nombre, descripcion=None, active=True, fecha_creacion=None, fecha_modificacion=None):
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.active = active
        self.fecha_creacion = fecha_creacion
        self.fecha_modificacion = fecha_modificacion
