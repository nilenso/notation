FROM ruby:2.6.8

RUN apt-get update && apt-get install -y postgresql-client nodejs yarn

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /notation

COPY Gemfile Gemfile.lock ./

COPY . .

RUN gem install bundler -v 2.2.28
RUN bundle _2.2.28_ install
RUN rake yarn:install

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
