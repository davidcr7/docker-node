var http = require("http");

http.createServer(function(req,res){
   res.writeHead(200,{"Content-type":"text/blain"});
   res.write("Hello My love NodeJs");
   res.end();
}).listen(8080);