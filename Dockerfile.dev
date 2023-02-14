# Start with a Ruby 3.1.3 image
FROM ruby:3.1.3

# Install nodejs
RUN apt-get update && apt-get install -y nodejs

# Set the working directory for the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container and install gems
COPY Gemfile* .
RUN bundle install

# Copy the entire project into the container
COPY . .

# Set the default command for the container to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]