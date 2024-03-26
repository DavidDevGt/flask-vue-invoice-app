from datetime import datetime
import re
from werkzeug_security import generate_password_hash, check_password_hash

def obtener_fecha_actual(): # 2001-12-30 16:24:30
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

def hash_contrasena(contrasena):
    return generate_password_hash(contrasena)

def verificar_contrasena(hash_contrasena, contrasena):
    return check_password_hash(hash_contrasena, contrasena)

def validar_correo(email):
    # Regex validar correo
    regex_email = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
    return re.fullmatch(regex_email, email) is not None
