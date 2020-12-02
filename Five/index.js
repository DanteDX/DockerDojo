const express = require("express");
const redis = require("redis");
const process = require('process');
const app = express();
const client = redis.createClient({
    host:'redis-server',
    port: 6379 //default redis server port
});
client.set('visits',0);

app.get("/",(req,res) =>{
    // this container will only restart if it exits with an error code
    process.exit(0);
    client.get('visits',(err,visits)=>{
        res.send('Number of visits is: ' + visits);
        client.set("visits", parseInt(visits) + 1);
    })
});

app.listen(9000,() =>{
    console.log("Listening to port 9000");
});

