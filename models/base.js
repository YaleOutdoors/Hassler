var knex = require('knex')({
  client: 'pg',
  connection: {
    host: '127.0.0.1',
    user: 'hassler',
    password: 'yohohoho',
    database: 'hassler_dev'
  }
});

var bookshelf = require('bookshelf')(knex);

module.exports = bookshelf
