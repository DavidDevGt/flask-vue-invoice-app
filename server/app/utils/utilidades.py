from datetime import datetime
import re
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
from flask import current_app

def obtener_fecha_actual():  # 2001-12-30 16:24:30
    """Obtiene la fecha y hora actual en formato de cadena."""
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

def hash_contrasena(contrasena):
    """Genera un hash de una contraseña."""
    return generate_password_hash(contrasena)

def verificar_contrasena(hash_contrasena, contrasena):
    """Verifica una contraseña contra su hash."""
    return check_password_hash(hash_contrasena, contrasena)

def validar_correo(email):
    """Valida si una dirección de correo electrónico tiene un formato correcto."""
    regex_email = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
    return re.fullmatch(regex_email, email) is not None

def generar_token_jwt(usuario_id):
    """Genera un token JWT para un usuario."""
    try:
        payload = {
            'exp': datetime.utcnow() + current_app.config['JWT_EXPIRATION_DELTA'],
            'iat': datetime.utcnow(),
            'sub': usuario_id
        }
        return jwt.encode(
            payload,
            current_app.config['JWT_SECRET_KEY'],
            algorithm='HS256'
        )
    except Exception as e:
        return e

def decodificar_token_jwt(token):
    """Decodifica un token JWT y recupera el ID del usuario."""
    try:
        payload = jwt.decode(token, current_app.config['JWT_SECRET_KEY'], algorithms=['HS256'])
        return payload['sub']
    except jwt.ExpiredSignatureError:
        return "El token ha expirado."
    except jwt.InvalidTokenError:
        return "Token inválido."