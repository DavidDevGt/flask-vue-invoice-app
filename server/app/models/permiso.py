class Permiso:
    def __init__(self, id, nombre, module_id, escritura=False, lectura=False, active=True, fecha_creacion=None, fecha_modificacion=None):
        self.id = id
        self.nombre = nombre
        self.module_id = module_id
        self.escritura = escritura
        self.lectura = lectura
        self.active = active
        self.fecha_creacion = fecha_creacion
        self.fecha_modificacion = fecha_modificacion
