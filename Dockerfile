FROM ruby:2.6.3
COPY . /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
CMD ["rails", "s"]
