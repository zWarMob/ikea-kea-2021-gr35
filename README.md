# ikea-kea-2021-gr35
To connect to the database, use the credentials bellow:

Server: sql4.freemysqlhosting.net

Name: sql4396600

Usr: sql4396600

Passw: FflNQBLCS7

Port number: 3306


# To run a local server with an example:
1. download the contents of the `server` folder
2. set up a virtual environment `python -m venv venv`
3. activate the virtual env. `venv\Scripts\activate`
4. install flask in it `pip install Flask`
5. install flask-mysqldb `pip install flask-mysqldb`
6. set up the starting file for flask `$env:FLASK_APP = "demo.py"`
7. run it! `flask run`	
8. Go to `http://localhost:5000/orders` to see the current orders
9. Open `http://127.0.0.1:5000/order/create/{withPickup}/{withDelivery}` but replace `{withPickup}` and `{withDelivery}` with a 1 or 0
10. Reload `http://localhost:5000/orders` to see your order show up
