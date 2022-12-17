# Bash Script

### Count File in a Directory
```sh
# ./countfiles.sh <directorytarget> ....<directorytarget>
bash countfiles.sh example/ ./ tmp/ img/
# example/ : 7
# ./ : 11
# tmp/ : 1
# img/ : 7
```

### Rename JPG Files with This Day Prefix
```sh
bash renamejpg.sh
# backend.jpg     --->    20221217-backend.jpg
# interview.jpg   --->    20221217-interview.jpg
# lang.jpg        --->    20221217-lang.jpg
# meme.jpg        --->    20221217-meme.jpg
# memedev.jpg     --->    20221217-memedev.jpg
# proggamer.jpg   --->    20221217-proggamer.jpg
# programmer.jpg  --->    20221217-programmer.jpg
```

### Start Stop Forever Server
```sh
bash forever.sh start # start server
# foreverserver was stoped ....
# foreverserver is starting with PID.... 3626

bash forever.sh stop
# foreverserver is stoped ....
```