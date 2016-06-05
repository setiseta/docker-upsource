# Upsource

[Upsource](https://jetbrains.com/upsource/) is a repository browsing and code review tool from [JetBrains](https://jetbrains.com/).

- Version 2.5.5074
- Version 3.0.3 Build 4364, latest

## Usage

 - you should have at least 8GB Ram to run this container well.

```bash
NAME="upsource"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
mkdir $DIR/data
chown 1000:1000 $DIR/data
docker run -d \
	-e BASE_URL=[your URL] \
	--name $NAME  \
	-p 8080:8080 \
	--restart=always \
	-v $DIR/data:/data
	seti/upsource
```

## Credits
 - forked from esycat/upsource
