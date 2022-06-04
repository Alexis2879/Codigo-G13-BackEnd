const express = require('express');

const app = express();

app.use(function(req,res,next){
    console.log('time',date.now());
    next()
})
app.get("/",(req,res)=>{
    res.json({
        content:"ejemplo de middlewares"
    })
})


app.listen(5000,()=>console.log("http://localhost:5000"));