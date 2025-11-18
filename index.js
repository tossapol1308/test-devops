const lynx = require('lynx');

// instantiate a metrics client
//  Note: the metric hostname is hardcoded here
const metrics = new lynx('localhost', 8125);

// sleep for a given number of milliseconds
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function main() {
  // send message to the metrics server
  metrics.timing('test.core.delay', Math.random() * 1000);

  // sleep for a random number of milliseconds to avoid flooding metrics server
  return sleep(3000);
}

// infinite loop
(async () => {
  console.log("🚀🚀🚀");
  while (true) { await main() }
})()
  .then(console.log, console.error);


// const lynx = require('lynx')

// const STATSD_HOST = process.env.STATSD_HOST || 'statsd'
// const STATSD_PORT = process.env.STATSD_PORT || 8125

// // instantiate a metrics client
// const metrics = new lynx(STATSD_HOST, STATSD_PORT)

// function sleep(ms) {
//   return new Promise(resolve => setTimeout(resolve, ms))
// }

// async function main() {
//   metrics.timing('test.core.delay', Math.random() * 1000)
//   return sleep(3000)
// }

// ;(async () => {
//   console.log('🚀🚀🚀 worker started')
//   while (true) {
//     await main()
//   }
// })().then(console.log, console.error)
