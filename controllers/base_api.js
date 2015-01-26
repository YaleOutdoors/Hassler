// base methods for API generalization

var base = {}
base.handle_error = function(error, res) {
  res.status(500).json({error: true,
    data: error.message
  });
}

base.render_data = function(res, object) {
  if (object) {
    res.json({error: false,
      data: object.toJSON()
    });
  } else {
    res.status(500).json({error: true,
        data: 'Record not found'
    });
  }
}

base.resolve = function(res, promise) {
  promise.fetch()
    .then(function(object) {
      base.render_data(res, object)
    })
    .otherwise(function(error) {
      base.handle_error(error, res);
    });
};

module.exports = base;

