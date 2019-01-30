var http = require("http");

http.createServer(function(req,res){
   res.writeHead(200,{"Content-type":"text/blain"});
   res.write("Hello My love NodeJs 啊啊啊as");
   res.end();
}).listen(8080);