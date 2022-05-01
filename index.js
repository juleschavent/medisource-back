if (typeof(PhusionPassenger) !== 'undefined') {
    PhusionPassenger.configure({ autoInstall: false });
}

const express = require('express')
const app = express()
const mysql = require('mysql')
const cors = require('cors')

app.use(cors())
app.use(express.json())

const db = mysql.createConnection({
    user: 'bofv3727_admin',
    host: 'localhost',
    password: 'a8K1#I3%66pR',
    database: 'bofv3727_medisource-db',
})

if (typeof(PhusionPassenger) !== 'undefined') {
    app.listen('passenger');
} else {
    app.listen(3000);
}

////////////////////////////////////////            READ
app.get('/systeme', (req, res) => {
    db.query(`SELECT * FROM systeme`,
        (err, result) => {
            if (err) {
                console.log(err)
            } else {
                res.send(result)
            }
        })
})

app.get('/organe', (req, res) => {
    db.query(`SELECT * FROM organe`,
        (err, result) => {
            if (err) {
                console.log(err)
            } else {
                res.send(result)
            }
        })
})