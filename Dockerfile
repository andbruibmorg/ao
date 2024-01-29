# 使用官方Nginx镜像作为基础镜像
FROM nginx:latest

# 设置环境变量的默认值
ENV SERVER_NAME localhost

# 添加Nginx配置文件模板
ADD proxy.conf /etc/nginx/templates/default.conf.template
# 删除默认的配置文件
RUN rm -rf /etc/nginx/conf.d/default.conf

# 暴露容器的80端口
EXPOSE 80

# 添加一个启动脚本为CMD命令
CMD envsubst '$SERVER_NAME' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
