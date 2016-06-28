FROM centos:7
MAINTAINER "Sergey Anisimov" <sa@uniz.ru>
ENV container=docker
ENV SALESPLATFORM_VERION=6.4.0-201512
ENV KLADR_VERSION=6.3.0-201507
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;\
localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8;\
yum -y update && yum -y install epel-release && yum -y install httpd php php-mysql php-pear php-devel gcc make mariadb openssh-server php-mbstring php-imap && yum clean all;\
pecl install timezonedb;\
systemctl enable httpd.service;\
systemctl enable sshd.service;\
echo "root:pfhgkfnf" | chpasswd;
#RUN  localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8;
RUN sed -i.bak s/en_US/ru_RU/g /etc/locale.conf;
#RUN  /usr/bin/localectl set-locale LANG=ru_RU.UTF-8;

ADD http://heanet.dl.sourceforge.net/project/salesplatform/salesplatform-vtigercrm-${SALESPLATFORM_VERION}.tar.gz /var/www/html
ADD http://heanet.dl.sourceforge.net/project/salesplatform/addons/salesplatform-kladr-${KLADR_VERSION}.tar.gz /usr/src/
#ADD files/salesplatform-vtigercrm-6.4.0-201512.tar.gz /var/www/html
ADD files/salesplatform.ini /etc/php.d/salesplatform.ini

#ADD files/createdb.sql /tmp/.
RUN tar xzvf /var/www/html/salesplatform-vtigercrm-6.4.0-201512.tar.gz -C /var/www/html;
COPY files/kladrDB.config.inc /var/www/html/vtigercrm/modules/SPKladr/kladrDB.config.inc
RUN chown -R apache:apache /var/www/html;

#VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]
EXPOSE 80 22
CMD ["/usr/sbin/init"]