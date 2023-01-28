FROM ruby:3.1.3
RUN apt-get update && apt-get install -y nodejs
WORKDIR /app
COPY Gemfile* .
RUN bundle install
COPY . .
CMD ["rails", "server", "-b", "0.0.0.0"]