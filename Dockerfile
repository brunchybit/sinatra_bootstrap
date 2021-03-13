FROM ruby:2.7.0 as builder

ARG BUNDLER_VERSION
ENV BUNDLER_VERSION=$BUNDLER_VERSION
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev
RUN gem install bundler -v $BUNDLER_VERSION

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle check || bundle install

WORKDIR /app
ADD . /app

ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["rackup", "--host", "0.0.0.0"]