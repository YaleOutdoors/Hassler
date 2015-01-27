var knex = require('knex')({
  client: 'pg',
  connection: {
    host: '127.0.0.1',
    user: 'hassler',
    password: 'yohohoho',
    database: 'hassler_dev'
  }
});

var _ = require('lodash');
var sequence = require('when/sequence');

var Schema = require('./schema');

var dropTable = function(tableName) {
  return knex.schema.dropTable(tableName);
};


var dropTables = function() {
  var tableNames = _.keys(Schema);
  var tables = [];
  tables = _.map(tableNames, function(tableName) {
    return function() {
      return dropTable(tableName);
    };
  });
  return sequence(tables);
}

dropTables().then(function() {
  console.log('Tables dropped');
  process.exit(0);
}).otherwise(function (err) {
  throw err;
});


