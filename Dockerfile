# 使用官方Nginx镜像作为基础镜像
FROM nginx:latest

# 设置环境变量的默认值
ENV server_name localhost

ADD proxy.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf


# 暴露容器的80端口
EXPOSE 80

# 添加一个启动脚本为CMD命令
CMD sed -i "s/example.com/$server_name/g" /etc/nginx/nginx.conf && nginx -g 'daemon off;'
