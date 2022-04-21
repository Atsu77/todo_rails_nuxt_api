FROM ruby:3.0.0

ARG WORKDIR
ARG CONTAINER_PORT

ENV HOME=/${WORKDIR} \
    RUNTIME_PACKAGES="nodejs vim"


RUN apt-get update -qq && \
    apt-get install -y ${RUNTIME_PACKAGES}
RUN mkdir ${WORKDIR}
WORKDIR ${HOME}
COPY Gemfile ${HOME}/Gemfile
COPY Gemfile.lock ${HOME}/Gemfile.lock
RUN bundle install

ADD . ./

EXPOSE ${CONTAINER_PORT}
