var coffee = require('coffee-script');
coffee.register();
var noflo = require('noflo');

noflo.loadFile('graphs/Qux.fbp', process.cwd(), function(err, network) {
  console.log('went into app');
  console.log(err, network);
  return network;
});
