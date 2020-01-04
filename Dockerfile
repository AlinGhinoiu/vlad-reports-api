FROM ruby:2.6.3
COPY vlad-reports-api /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
CMD ["bundle", "exec", "bin/rails", "server", "-p", "3000"]
