FROM ruby:2.7.2

# repos
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash -

# installing
RUN apt-get update -qq && \
  apt-get install -y \
  apt-utils \
  yarn \
  nodejs \
  postgresql-client

RUN mkdir /groshoppify
WORKDIR /groshoppify
COPY Gemfile /groshoppify/Gemfile
COPY Gemfile.lock /groshoppify/Gemfile.lock

RUN yarn install --production
COPY . .
RUN bin/rails webpacker:compile
RUN bin/rails assets:precompile
# Remove folders not needed in resulting image
RUN rm -rf node_modules vendor/assets spec tmp/cache/assets  tmp/cache/bootsnap-compile-cache tmp/cache/pids
# tmp/cache


RUN bundler install
COPY . /groshoppify

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]