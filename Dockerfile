FROM ruby:2.5.1-alpine
MAINTAINER admin
RUN cd /tmp \
  && apk --no-cache add \
    curl \
    curl-dev \
    nodejs \
    libstdc++ \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    mysql-client \
    mysql-dev \
    pcre \
    ruby-dev \
    ruby-json \
    tzdata \
    yaml \
    yaml-dev \
    bash \
    build-base \
    zlib-dev \
  && mkdir /sample_docker/
WORKDIR /sample_docker/
COPY Gemfile* /sample_docker/
RUN gem install bundler \
  && bundle install --clean --path /bundle
COPY . /sample_docker/
CMD ["bundle", "exec", "rails", "s"]
