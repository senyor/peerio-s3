# Fair Warning

[![Greenkeeper badge](https://badges.greenkeeper.io/PeerioTechnologies/peerio-s3.svg)](https://greenkeeper.io/)

This module supersedes `ceph-s3`, as I haven't been able to get my last
contribution merged in (`dropFile` method).
If you don't know what you're doing here, you probably just want to use `knox`
or `ceph-s3`.

# S3 compatible client wrapper based on ceph-s3/knox

```bash
npm install peerio-s3 -S
```

## Usage

You could use a `users.json` file to your library's root directory, as the
author suggests.

Or you could define a few environment variables starting your processes.
Here's an exhaustive list, and their defaults:

```bash
export S3_STORE_PORT=6788
export S3_STORE_BUCKET_NAME=changeme
export S3_STORE_STYLE=path
export S3_STORE_HOST=127.0.0.1
export S3_STORE_PROTO=http
```

Otherwise just user ./lib/users or init function to pass your user
configuration:

```js
var S3Client = require('ceph-s3');

// pass users that you will use with this client
s3Client.init({

    myusername: {
        access_key: '',
        secret_key: ''
    },

    wonderfuluser: {
        access_key: '',
        secret_key: ''
    }

});

// can use anything that is supported by knox - https://github.com/Automattic/knox
var usernameClient = new S3Client({ bucket: 'mrusername' }, 'myusername', function (err) {
    if (err) {
        // failed to auth / connect / etc
        throw err;
    }

    console.log('Init complete');
});

// any errors during init will be suppressed in _.noop
// // access knox directly with mrwondeful.s3 if need be
var mrwondeful = newS3Client({ bucket: 'wonderful' }, 'mrwonderful');

// the only useful abstraction besides adding simple user management
var opts = {
    buffer: new Buffer('Contents of the file', 'utf-8'),
    filename: 'useless.txt',
    headers: {} // optional
};

mrwondeful.storeFile(opts, function (err, filename) {
    if (err) {
        throw err;
    }

    console.log(filename ? 'Uploaded %s' : 'Failed', filename);
});

var opts = { filename: 'useless.txt' };

mrwondeful.dropFile(opts, function (err) {
    if (err) {
        throw err;
    }

    console.log('Dropped file');
});
```
