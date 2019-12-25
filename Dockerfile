FROM ruby:2.6.5
COPY . /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
