FROM opencpu/base
LABEL Charalampos Chomenidis <hampos@me.com>
LABEL Pantelis Karatzas <pantelispanka@gmail.com>
# RUN apt-get -y install libxml2-dev libcurl4-openssl-dev

RUN R -e "install.packages(c('RCurl' ,'pmml' ,'jsonlite' ,'httk' ,'ggplot2', 'reshape2'), repos='http://cran.cc.uoc.gr/mirrors/CRAN/')"
COPY httkInt_1.0.tar.gz /packages/
USER root
RUN R CMD INSTALL /packages/httkInt_1.0.tar.gz --library=/usr/local/lib/R/site-library

CMD /usr/sbin/apache2ctl -D FOREGROUND
