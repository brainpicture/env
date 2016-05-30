var fs = require('fs')
var watch = require('node-watch')
var childProcess = require('child_process')
var spawn = childProcess.spawn
var exec = childProcess.exec
var path = process.argv[2]
var hostfull = process.argv[3].split(':', 2)
var host =  hostfull[0];
var hostpath = hostfull[1] ? hostfull[1] : './';
if (!path) {
  throw new Error('no path passed, usage: watch [path] [host]')
}
if (!host) {
  throw new Error('no host passed, usage: watch [path] [host]')
}
var cp = '/tmp/'+host.replace(/@/g, '_').replace(/[^a-zA-Z0-9_\-]/g, '');

function color(str, color) {
  return String.fromCharCode(27)+"[1;3"+color+"m"+str+String.fromCharCode(27)+"[0m"
}

function get(cb) {
  var rsync = spawn('rsync', ['-avrz', '-e', `ssh -o 'ControlPath=${cp}'`, '--exclude', '.git', '--exclude', '.bin', '--exclude', '.DS_Store', host+':'+hostpath, path]);
  rsync.stdout.on('data', (data) => {
    process.stdout.write(data);
  })
  rsync.stderr.on('data', (data) => {
    process.stdout.write(data);
  })
  rsync.on('close', cb)
}

function rsync(file, cb) {
  var params = '-avz'
  if (!file) {
    params += 'r'
    file = ''
  }
  var rsync = spawn('rsync', [params, '-e', `ssh -o 'ControlPath=${cp}'`, '--exclude', '.git', '--exclude', '.bin', '--exclude', '.DS_Store', path+file, host+':'+hostpath+file]);
  /*rsync.stdout.on('data', (data) => {
    process.stdout.write(data);
  })*/
  rsync.stderr.on('data', (data) => {
    process.stdout.write(data);
  })
  rsync.on('close', cb)
}

console.log(color('Preparing', 3));

var queueFiles = {};
var queueLock = false
var queueGetOnEmpty = false

function fetchQueue() {
  if (queueLock) return
  for(var rel in queueFiles) {
    queueLock = true
    var dateStr = (new Date()).toLocaleString('ru', {
      hour: 'numeric',
      minute: 'numeric',
      second: 'numeric'
    })
    process.stdout.write(dateStr+' '+color(rel, 3));
    rsync(rel, (code) => {
      if (code == '0') {
        process.stdout.write(color(' [OK]\n', 2));
      } else {
        process.stdout.write(color(' [FAIL]\n', 1));
      }
      delete queueFiles[rel]
      queueLock = false
      fetchQueue()
    })
    return
  }
  if (queueGetOnEmpty) {
    queueLock = true
    queueGetOnEmpty = false
    get(() => {
      queueLock = false
      fetchQueue()
    })
  }
}


try {
  fs.unlinkSync(cp);
} catch(e) {}
var ssh = spawn('ssh', ['-nNf', '-o', 'ControlMaster=yes', '-o', 'ControlPath='+cp, host], {stdio: 'inherit'});
ssh.on('close', (data) => {
  get(() => {
    console.log(color('Watching', 4));

    watch(path, function(filename) {
      if (path == filename.slice(0, path.length)) {
        var rel = filename.slice(path.length)
      } else {
        var rel = filename;
      }
      queueFiles[rel] = true;
      fetchQueue()
    });

    watchGit()
  })
})

function watchGit() {
  /*var checker = 'watch -gt "git rev-parse HEAD"';
  var watchGit = spawn('ssh', ['-o', 'ControlMaster=no', '-o', 'ControlPath='+cp, host, '-T', "'"+checker+"'"]);

  watchGit.stdout.on('data', (data) => {
    process.stdout.write(data)
  })
  watchGit.stderr.on('data', (data) => {
    process.stdout.write(data)
  })
  watchGit.on('close', (code) => {
    queueGetOnEmpty = true;
    fetchQueue()
  })*/
}
