FROM node:10.15.0-alpine

#安装基础工具
RUN  apk add vim

#创建项目目录
RUN mkdir -p /data/www

#设置工作区间
WORKDIR /data/www

COPY ./ /data/www

RUN npm config set unsafe-perm true

#安装pm2
RUN npm install pm2 -g

RUN cd /data/www \
	npm install

# RUN pm2 start index.js
CMD [ "node", "index.js" ]
