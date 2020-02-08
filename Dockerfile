FROM centos/mysql-57-centos7:latest
LABEL maintainer="hitchenlunwei@gmail.com"
USER root
# 复制数据库初始化脚本
COPY 55_post-init.sh /usr/share/container-scripts/mysql/init/55_post-init.sh
RUN chmod +x /usr/share/container-scripts/mysql/init/55_post-init.sh
# 安装node
COPY node-v8.12.0-linux-x64.tar.gz /home/node.tar.gz
RUN tar --strip-components 1 -xzf /home/node.tar.gz -C /usr/local
USER mysql
ENV MYSQL_USER demo
ENV MYSQL_PASSWORD demo
ENV MYSQL_DEFAULT_AUTHENTICATION_PLUGIN mysql_native_password
ENV MYSQL_DATABASE demo
#将所需文件放到容器中
COPY schema.sql /usr/share/container-scripts/mysql/schema.sql
# 设置容器启动时执行的命令
ENTRYPOINT ["container-entrypoint"]
CMD ["run-mysqld"]
