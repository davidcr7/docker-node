var http = require("http");

http.createServer(function(req,res){
   res.writeHead(200,{"Content-type":"text/blain"});
   res.write("Cristiano Ronaldo DavidCR We Are Champion yes!!!");
   res.end();
}).listen(8080);
