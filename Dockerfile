# 使用官方Nginx镜像作为基础镜像
FROM nginx:latest

# 将你的Nginx配置文件添加到容器中
ADD proxy.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf

# 暴露容器的80端口
EXPOSE 80

# 容器启动时运行的命令
CMD ["nginx", "-g", "daemon off;"]
