from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
import datetime

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost' 
app.config['MYSQL_USER'] = 'root' 
app.config['MYSQL_PORT'] = 3360 
app.config['MYSQL_PASSWORD'] = '' 
app.config['MYSQL_DB'] = 'perpustakaan' 
mysql = MySQL (app)
########awdad
# ===============================Root==============================
@app.route('/')
def root():
     return('''
     <body style="background: linear-gradient(to right, #A7BFE8 0%, #33ccff 100%);">

     <h1>API Perpustakaan</h1> <br>
     <h2>Endpoint:</h2>
     1. get/mahasiswa <br>
     2. post/mahasiswa <br>
     3. put/updatemahasiswa <br>
     4. get/detailmahasiswa <br>
     5. delete/deletemahasiswa <br>
     6. get/buku <br>
     7. get/petugas <br>
     8. get/pengembalian <br>
     9. get/peminjaman <br>
     10. post/peminjaman <br>
     11. get/peminjamanbukumahasiswa <br>
     12. get/detailpeminjamanbukumahasiswa <br>
       <br><br><br>

     Dibuat oleh:<br>
     NAMA: NOVAN JANIS ADITYA HALAWA<br>
     NIM: 1202201382<br>
     KELEAS: SI-44-03 <br>
     </body>
     ''')

# ===============================Detail Mahasiswa==============================
@app.route('/detailmahasiswa')
def detailmahasiswa():
    if 'NIM' in request.args:
        cursor = mysql.connection.cursor()
        query = "select * from tb_mahasiswa where NIM = %s"
        data = (request.args['NIM'],)
        cursor.execute(query, data)
        col_names = [i[0] for i in cursor.description]
        detail = []
        for row in cursor.fetchall():
            detail.append(dict(zip(col_names, row)))
        status_code = 200
        response = jsonify(data)
        response.status_code = status_code
        now = datetime.datetime.now()
        return jsonify(f"timestamp: {now} -- status: {response}",detail)
        cursor.close()
    elif 'nama_mahasiswa' in request.args:
        cursor = mysql.connection.cursor()
        query = "select * from tb_mahasiswa where nama_mahasiswa = %s"
        data = (request.args['nama_mahasiswa'],)
        cursor.execute(query, data)
        col_names = [i[0] for i in cursor.description]
        detail = []
        for row in cursor.fetchall():
            detail.append(dict(zip(col_names, row)))
        status_code = 200
        response = jsonify(data)
        response.status_code = status_code
        now = datetime.datetime.now()
        return jsonify(f"timestamp: {now} -- status: {response}",detail)
        cursor.close()
    else:
        return("insert parameter for query string")

# ===============================Delete Mahasiswa==============================
@app.route('/deletemahasiswa',methods=['delete'])
def deletemahasiswa():
     if 'NIM' in request.args:
        cursor = mysql.connection.cursor()
        query = "delete from tb_mahasiswa where NIM = %s"
        data = (request.args['NIM'],)
        cursor.execute(query, data)
        mysql.connection.commit()
        status_code = 200
        response = jsonify(data)
        response.status_code = status_code
        now = datetime.datetime.now()
        return jsonify({'message': f'Successfully delete data mahasiswa -- timestamp: {now} -- status: {response} '})


# ===============================Create, Read Mahasiswa==============================
@app.route('/mahasiswa',methods=['GET', 'POST']) 
def mahasiswa():
        if request.method == 'GET':
            cursor = mysql.connection.cursor()
            cursor.execute("select * from tb_mahasiswa")
            col_names=[i[0] for i in cursor.description]
            data=[]
            for row in cursor.fetchall():
                data.append(dict(zip(col_names, row)))
            status_code = 200
            response = jsonify(data)
            response.status_code = status_code
            now = datetime.datetime.now()
            return jsonify(f"timestamp: {now} -- status: {response}",data)
            cursor.close()
        elif request.method == 'POST':
            nim = request.json.get('NIM')
            nama_mahasiswa = request.json.get('nama_mahasiswa')
            jurusan = request.json.get('jurusan')
            tanggal_lahir = request.json.get('tanggal_lahir')
            usia = request.json.get('usia')
            jenis_kelamin = request.json.get('jenis_kelamin')
            alamat = request.json.get('alamat')
            no_hp = request.json.get('no_hp')
            cursor = mysql.connection.cursor()
            query = "insert into tb_mahasiswa (NIM, nama_mahasiswa, jurusan, tanggal_lahir, usia, jenis_kelamin, alamat, no_hp) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            data = (nim, nama_mahasiswa, jurusan, tanggal_lahir, usia, jenis_kelamin, alamat, no_hp)
            cursor.execute(query,data)
            mysql.connection.commit()
            status_code = 200
            response = jsonify(data)
            response.status_code = status_code
            now = datetime.datetime.now()
            return jsonify({'message': f'Successfully insert data mahasiswa -- timestamp: {now} -- status: {response} '})
            cursor.close()


# ===============================Update Mahasiswa==============================
@app.route('/updatemahasiswa',methods=['PUT'])
def updatemahasiswa():
    if 'NIM' in request.args:
        nim = (request.args['NIM'],)
        nama_mahasiswa = request.json.get('nama_mahasiswa')
        jurusan = request.json.get('jurusan')
        tanggal_lahir = request.json.get('tanggal_lahir')
        usia = request.json.get('usia')
        jenis_kelamin = request.json.get('jenis_kelamin')
        alamat = request.json.get('alamat')
        no_hp = request.json.get('no_hp')
        cursor = mysql.connection.cursor()
        query = "update tb_mahasiswa set nama_mahasiswa=%s, jurusan=%s, tanggal_lahir=%s, usia=%s, jenis_kelamin=%s, alamat=%s, no_hp=%s where NIM=%s"
        data = (nama_mahasiswa, jurusan, tanggal_lahir, usia, jenis_kelamin, alamat, no_hp, nim)
        cursor.execute(query,data)
        mysql.connection.commit()
        status_code = 200
        response = jsonify(data)
        response.status_code = status_code
        now = datetime.datetime.now()
        return jsonify({'message': f'Successfully update data mahasiswa -- timestamp: {now} -- status: {response} '})
        cursor.close()

# ===============================GET buku==============================
@app.route('/buku')
def buku():
    cursor = mysql.connection.cursor()
    cursor.execute("select * from tb_buku")
    col_names=[i[0] for i in cursor.description]
    data=[]
    for row in cursor.fetchall():
        data.append(dict(zip(col_names, row)))
    status_code = 200
    response = jsonify(data)
    response.status_code = status_code
    now = datetime.datetime.now()
    return jsonify(f"timestamp: {now} -- status: {response}",data)
    cursor.close()
     
# ===============================GET petugas==============================
@app.route('/petugas')
def petugas():
    cursor = mysql.connection.cursor()
    cursor.execute("select * from tb_petugas")
    col_names=[i[0] for i in cursor.description]
    data=[]
    for row in cursor.fetchall():
        data.append(dict(zip(col_names, row)))
    status_code = 200
    response = jsonify(data)
    response.status_code = status_code
    now = datetime.datetime.now()
    return jsonify(f"timestamp: {now} -- status: {response}",data)
    cursor.close()

# ===============================GET pengembalian==============================
@app.route('/pengembalian')
def pengembalian():
    cursor = mysql.connection.cursor()
    cursor.execute("select * from tb_pengembalian")
    col_names=[i[0] for i in cursor.description]
    data=[]
    for row in cursor.fetchall():
        data.append(dict(zip(col_names, row)))
    status_code = 200
    response = jsonify(data)
    response.status_code = status_code
    now = datetime.datetime.now()
    return jsonify(f"timestamp: {now} -- status: {response}",data)
    cursor.close()

# ===============================GET, POST Peminjaman==============================
@app.route('/peminjaman',methods=['GET', 'POST']) 
def peminjaman():
        if request.method == 'GET':
            cursor = mysql.connection.cursor()
            cursor.execute("select * from tb_peminjaman")
            col_names=[i[0] for i in cursor.description]
            data=[]
            for row in cursor.fetchall():
                data.append(dict(zip(col_names, row)))
            status_code = 200
            response = jsonify(data)
            response.status_code = status_code
            now = datetime.datetime.now()
            return jsonify(f"timestamp: {now} -- status: {response}",data)
            cursor.close()
        elif request.method == 'POST':
            nim = request.json.get('NIM')
            id_buku = request.json.get('id_buku')
            id_petugas = request.json.get('id_petugas')
            tanggal_pinjam = request.json.get('tanggal_pinjam')
            tanggal_kembali = request.json.get('tanggal_kembali')
            cursor = mysql.connection.cursor()
            query = "insert into tb_peminjaman (NIM, id_buku, id_petugas, tanggal_pinjam, tanggal_kembali) VALUES (%s, %s, %s, %s, %s)"
            data = (nim, id_buku, id_petugas, tanggal_pinjam, tanggal_kembali)
            cursor.execute(query,data)
            mysql.connection.commit()
            status_code = 200
            response = jsonify(data)
            response.status_code = status_code
            now = datetime.datetime.now()
            return jsonify({'message': f'Successfully insert data peminjaman -- timestamp: {now} -- status: {response} '})
            cursor.close()


#menggabungkan tb_mahasiswa, tb_buku, dan tb_peminjaman
# ===============================GET Peminjaman Buku Mahasiswa ==============================

@app.route('/peminjamanbukumahasiswa')
def peminjamanbukumahasiswa():
    cursor = mysql.connection.cursor()
    cursor.execute("select tb_mahasiswa.NIM, tb_mahasiswa.nama_mahasiswa, tb_buku.id_buku,  tb_buku.judul_buku,tb_peminjaman.id_peminjaman, tb_peminjaman.tanggal_pinjam from tb_mahasiswa JOIN tb_peminjaman on tb_peminjaman.NIM = tb_mahasiswa.NIM JOIN tb_buku on tb_peminjaman.id_buku = tb_buku.id_buku ;")
    col_names=[i[0] for i in cursor.description]
    data=[]
    for row in cursor.fetchall():
        data.append(dict(zip(col_names, row)))
    status_code = 200
    response = jsonify(data)
    response.status_code = status_code
    now = datetime.datetime.now()
    return jsonify(f"timestamp: {now} -- status: {response}",data)
    cursor.close()
# ===============================GET Detail Peminjaman Buku Mahasiswa ==============================
@app.route('/detailpeminjamanbukumahasiswa')
def detailpeminjamanbukumahasiswa():
    if 'NIM' in request.args:
        cursor = mysql.connection.cursor()
        query=("select tb_mahasiswa.NIM, tb_mahasiswa.nama_mahasiswa, tb_buku.id_buku,  tb_buku.judul_buku,tb_peminjaman.id_peminjaman, tb_peminjaman.tanggal_pinjam from tb_mahasiswa JOIN tb_peminjaman on tb_peminjaman.NIM = tb_mahasiswa.NIM JOIN tb_buku on tb_peminjaman.id_buku = tb_buku.id_buku where tb_mahasiswa.NIM = %s;")
        data = (request.args['NIM'],)
        cursor.execute(query, data)
        col_names = [i[0] for i in cursor.description]
        detail = []
        for row in cursor.fetchall():
            detail.append(dict(zip(col_names, row)))
        status_code = 200
        response = jsonify(data)
        response.status_code = status_code
        now = datetime.datetime.now()
        return jsonify(f"timestamp: {now} -- status: {response}",detail)
        cursor.close()
    elif 'nama_mahasiswa' in request.args:
        cursor = mysql.connection.cursor()
        query=("select tb_mahasiswa.NIM, tb_mahasiswa.nama_mahasiswa, tb_buku.id_buku,  tb_buku.judul_buku,tb_peminjaman.id_peminjaman, tb_peminjaman.tanggal_pinjam from tb_mahasiswa JOIN tb_peminjaman on tb_peminjaman.NIM = tb_mahasiswa.NIM JOIN tb_buku on tb_peminjaman.id_buku = tb_buku.id_buku where tb_mahasiswa.nama_mahasiswa = %s;")
        data = (request.args['nama_mahasiswa'],)
        cursor.execute(query, data)
        col_names = [i[0] for i in cursor.description]
        detail = []
        for row in cursor.fetchall():
            detail.append(dict(zip(col_names, row)))
        status_code = 200
        response = jsonify(data)
        response.status_code = status_code
        now = datetime.datetime.now()
        return jsonify(f"timestamp: {now} -- status: {response}",detail)
        cursor.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=50, debug=True)
