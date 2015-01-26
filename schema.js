var Schema = {
  users: {
    id: {type: 'increments', nullable: false, primary: true},
    username: {type: 'string', nullable: false, unique: true},
    email: {type: 'string', nullable: false, unique: true},
    name: {type: 'string', nullable: false},
  },

  trips: {
    id: {type: 'increments', nullable: false, primary: true},
    desc: {type: 'text'},
    start_date: {type: 'date'},
    end_date: {type: 'date'},
    cost: {type: 'integer'},
  },

  trips_users: {
    id: {type: 'increments', nullable: false, primary: true},
    trip_id: {type: 'integer', nullable: false, unsigned: true},
    user_id: {type: 'integer', nullable: false, unsigned: true}
  }
}

module.exports = Schema;


