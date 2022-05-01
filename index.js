const express = require('express')
const app = express()
const mysql = require('mysql')
const cors = require('cors')

app.use(cors())
app.use(express.json())

const db = mysql.createConnection({
    user: 'bofv3727_admin',
    host: 'chvt.me',
    password: 'a8K1#I3%66pR',
    database: 'bofv3727_medisource-db',
})

app.listen(3001, () => {
    console.log('Server is running on port 3001')
})

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