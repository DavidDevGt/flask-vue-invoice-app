import pymysql
from flask import current_app, g
from pymysql.cursors import DictCursor

def get_db():
    if 'db' not in g:
        g.db = pymysql.connect(
            host=current_app.config['DB_HOST'],
            user=current_app.config['DB_USER'],
            password=current_app.config['DB_PASSWORD'],
            db=current_app.config['DB_NAME'],
            cursorclass=DictCursor
        )
    return g.db

def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

def db_query(query, args=(), one=False):
    with get_db().cursor() as cursor:
        cursor.execute(query, args)
        result = cursor.fetchone() if one else cursor.fetchall()
        return result
