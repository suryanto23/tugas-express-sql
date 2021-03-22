const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const mysql = require('mysql2')


// Buka koneksi untuk MySql
const connection =  mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "123456", 
    database : "purchase",
});

// Test koneksi
connection.connect(err => {
    if(err){
        console.log(err.sqlMessage);
    } else {
        console.log("berhasil connect database")
    }
})

// querry to database
// ini query untuk ambil semua data orderan di database purchase
const queryPurchase = `
    SELECT
    user.nama as customer,
    user.alamat,
    user.kode_pos,
    product.nama_produk,
    product.harga,
    orderItem.total_harga,
    orderItem.tanggal
    FROM user
    INNER JOIN orderItem
    ON user.user_ID = orderItem.user_ID
    INNER JOIN product
    ON orderItem.product_ID = product.product_ID
    `

app.use(express.json())

app.get("/" , (req,res)=>{
    res.send("Hello world pur")
})

app.get("/purchase" , (req,res) => {
    // mengeksekusi querries
    connection.query(queryPurchase, 
        (err, data) => {
            if(err){
                console.log(err)
            } else { 
                res.json(data)
            }
        }    
    )  
})

app.get("/purchase/:id" , (req,res) => {
    connection.query(`${queryPurchase} WHERE user.user_ID = ${req.params.id}` ,
    (err , data) => {
        if(err){
            console.log(err)
        } else {
            res.json(data)
        }
    }
   
    )
})


app.listen(PORT , ()=>{
    console.log("Express Triggered Sucsessfully");
})