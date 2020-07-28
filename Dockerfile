FROM ruby:2.6.1

# install cron
RUN apt-get update && apt-get install cron -y

RUN apt-get install postgresql-client -y

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install program to configure locales
RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
COPY .ruby-version /usr/src/app/
RUN bundle install

COPY . /usr/src/app

ENV LANG=en_US.UTF-8

ENV HANAMI_HOST=0.0.0.0
ENV HANAMI_ENV=production

EXPOSE 2300
CMD ["hanami", "server"]
