class Cliente:
    def __init__(self, id, nit, nombre, direccion, telefono=None, email=None, es_nit=True, active=True, fecha_creacion=None, fecha_modificacion=None):
        self.id = id
        self.nit = nit
        self.nombre = nombre
        self.direccion = direccion
        self.telefono = telefono
        self.email = email
        self.es_nit = es_nit
        self.active = active
        self.fecha_creacion = fecha_creacion
        self.fecha_modificacion = fecha_modificacion
