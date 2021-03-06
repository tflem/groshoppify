# Dockerfile

# Pre setup stuff
FROM ruby:2.7.2 as builder

# Add Yarn to the repository
RUN curl https://deb.nodesource.com/setup_14.x | bash && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install system dependencies & clean them up
RUN apt-get update -qq && apt-get install -y \
    postgresql-client build-essential yarn nodejs \
    libnotify-dev && \
    rm -rf /var/lib/apt/lists/*

# This is where we build the rails app
FROM builder as rails-app

# Allow access to port 3000
EXPOSE 3000
EXPOSE 3035

# This is to fix an issue on Linux with permissions issues
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG APP_DIR=/home/tfleming/groshoppify

# Create a non-root user
RUN groupadd --gid $GROUP_ID user
RUN useradd --no-log-init --uid $USER_ID --gid $GROUP_ID user --create-home

# Remove existing running server
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Permissions crap
RUN mkdir -p $APP_DIR
RUN chown -R $USER_ID:$GROUP_ID $APP_DIR


# Define the user running the container
USER $USER_ID:$GROUP_ID

WORKDIR $APP_DIR

# Install rails related dependencies
COPY --chown=1000:1000 Gemfile* $APP_DIR/

# For webpacker / node_modules
COPY --chown=1000:1000 package.json $APP_DIR
COPY --chown=1000:1000 yarn.lock $APP_DIR

RUN bundle install

# Copy over all files
COPY --chown=1000:1000 . .

RUN yarn install --prefer-offline --frozen-lockfile

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]