# -*- mode: dockerfile -*-
FROM ruby:3.4

RUN apt-get update
RUN apt-get install -y \
      nodejs \
      npm \
      cron \
  && npm install -g yarn

WORKDIR /teikitenkenyosi
COPY . /teikitenkenyosi

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0", "-e", "${RAILS_ENV}"]