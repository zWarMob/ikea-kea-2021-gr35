# Demonstrate that your prototype is suitable for supporting the business needs identified by
# populating the database with relevant test data. The preferred convention is to use one INSERT
# INTO statement for each table, and name the script in a logically, using a DML postfix. Make
# sure to write in your report what the data aims to show.

from flask import Flask, render_template, request, redirect, url_for, session, Markup
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import json
import datetime
import random

app = Flask(__name__)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'your secret key'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'sql4.freemysqlhosting.net'
app.config['MYSQL_USER'] = 'sql4396600'
app.config['MYSQL_PASSWORD'] = 'FflNQBLCS7'
app.config['MYSQL_DB'] = 'sql4396600'
app.config['MYSQL_DATABASE_CHARSET'] = 'utf8mb4'
app.config['MYSQL_CHARSET'] = 'utf8mb4'

# Intialize MySQL
mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/orders')
def orders_page():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM sql4396600.Order;')
    orders = cursor.fetchall()

    return render_template('orders.html', orders=orders)

@app.route('/order/create/<int:withPickup>/<int:withDelivery>')
def recommendation(withPickup,withDelivery):
    # create variables to create order
    # withPickup = random.randint(0, 1)
    # withDelivery = random.randint(0, 1)

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('''
        INSERT INTO sql4396600.Order (`Date`, withDelivery, withPickup, userId)
        VALUES (now(),%s,%s, 1)''', (withDelivery, withPickup))
    mysql.connection.commit()

    return "success"