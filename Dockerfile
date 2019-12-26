FROM ruby:2.6.3
COPY . /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
RUN rails s
