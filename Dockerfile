#基础镜像
FROM tomcat:7.0.86

#作者
LABEL maintainer="xingdiango@163.com"

#运行安装telnet和nc
RUN yum install -y telnet nc; exit 0

#
VOLUME ["/root/tomcat"]

#TOMCAT环境变量
ENV CATALINA_BASE:   /opt/tomcat/apache-tomcat-8.0.36 \
    CATALINA_HOME:   /opt/tomcat/apache-tomcat-8.0.36
    CATALINA_TMPDIR: /opt/tomcat/apache-tomcat-8.0.36/temp \
    JRE_HOME:        /usr/java/jdk1.8.0_161

#启动入口
ENTRYPOINT ["catalina.sh","run"]

#健康检查
# HEALTHCHECK --interval=10s --timeout=3s \
# 	CMD nc -z localhost 5198 >/dev/null || exit 1

#拷贝war包到tomcat
COPY target/DataCollect.war ${CATALINA_HOME}/webapps/
