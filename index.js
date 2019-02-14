var http = require("http");

http.createServer(function(req,res){
   res.writeHead(200,{"Content-type":"text/blain"});
   res.write("Cristiano Ronaldo DavidCR Come On !!!");
   res.end();
}).listen(8080);
