FROM tomcat:9.0.5-jre8
ENV APP_CONFIG_PROPERTIES=/IMS/INPUT/NOPURGEORDELETE/Centralized_Configurations.properties
ENV NE_DBCONFIG_PROPERTIES=/IMS/INPUT/NOPURGEORDELETE/dbconfig.properties
RUN apt-get -y update && apt-get install -y procps && apt-get install -y vim
COPY server.xml /usr/local/tomcat/conf/server.xml
COPY context.xml  /usr/local/tomcat/conf/context.xml
COPY setenv.sh  /usr/local/tomcat/bin/setenv.sh
RUN chmod +x /usr/local/tomcat/bin/setenv.sh
COPY /webapps/UniserveWeb_Okta  /usr/local/tomcat/webapps/UniserveWeb_Okta
COPY /webapps/jalsweb  /usr/local/tomcat/webapps/jalsweb
COPY /webapps/InmarsatBillview  /usr/local/tomcat/webapps/InmarsatBillview
COPY /webapps/BillsView  /usr/local/tomcat/webapps/BillsView
COPY /webapps/SCIM_Connector  /usr/local/tomcat/webapps/SCIM_Connector
COPY /lib/ojdbc6.jar  /usr/local/tomcat/lib/ojdbc6.jar
COPY /lib/commons-lang-2.4.jar  /usr/local/tomcat/lib/commons-lang-2.4.jar
RUN sed -i -e 's#InmarsatJNDI#jdbc/unipack4#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#INMARSAT_1#ORG_2#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#40B844DE6CFA7B8DA24D32#F5748583AEA4#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#D:/Applogs/Inmarsat-BillViewLogs#/IMS/INPUT/Logs/BILLVIEWLOGS#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#http://192.168.6.15:8181#https://dev-imsinmarsat.com#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#http://localhost:8686#https://dev-imsinmarsat.com#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#http://13.126.121.132:9999#https://dev-imsinmarsat.com#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#LINK= localhost:8686#LINK= dev-imsinmarsat.com#g' /usr/local/tomcat/webapps/InmarsatBillview/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#192.168.6.151#inmdev.czfsrhjli8vn.eu-west-1.rds.amazonaws.com#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#1521#1522#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#orcl#INMDEV#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#INMARSAT_2#uniserve#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#ROLEID=1#ROLEID=10#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#D:/Applogs/SCIMLogs#/IMS/INPUT/Logs/UP4LOGS#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/lib/Configurations.properties
RUN sed -i -e 's#orcl#INMDEV#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/dispatcher-servlet.xml
RUN sed -i -e 's#1521#1522#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/dispatcher-servlet.xml
RUN sed -i -e 's#192.168.6.151#inmdev.czfsrhjli8vn.eu-west-1.rds.amazonaws.com#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/dispatcher-servlet.xml
RUN sed -i -e 's#INMARSAT_2#ORG_2#g' /usr/local/tomcat/webapps/SCIM_Connector/WEB-INF/dispatcher-servlet.xml
RUN sed -i -e 's#D:/home/logs#/IMS/INPUT/Logs/ALERTS#g' /usr/local/tomcat/webapps/jalsweb/WEB-INF/lib/log4j.xml
RUN sed -i -e 's#SECURITY_APPLY_TYPE=AES#SECURITY_APPLY_TYPE=IN10S#g' /usr/local/tomcat/webapps/UniserveWeb_Okta/WEB-INF/lib/FeatureList.properties
RUN sed -i -e 's#SIGNATURE_SHOWHIDE_FLAG=true#SIGNATURE_SHOWHIDE_FLAG=false#g' /usr/local/tomcat/webapps/UniserveWeb_Okta/WEB-INF/lib/FeatureList.properties
