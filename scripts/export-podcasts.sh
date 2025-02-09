#!/bin/bash

sql() {
    sqlite3 "${HOME}/Library/Group Containers/"*.groups.com.apple.podcasts/Documents/MTLibrary.sqlite "select ${1} from ZMTPODCAST ${2:+"where ${2} = '${3}'"};" |\
        sed -e 's/&/\&amp;/g' \
            -e 's/</\&lt;/g' \
            -e 's/>/\&gt;/g' \
            -e "s/'/\&apos;/g"
}

opml_export=${HOME}/Desktop/podcasts.opml
cat > ${opml_export} << HEAD
<?xml version="1.0" encoding="utf-8"?>
<opml version="1.0">
<head><title>Podcast subscriptions</title></head>
<body>
<outline text="feeds">
HEAD

sql ZUUID | while read -r uuid ; do
    feed_url=$(sql ZFEEDURL ZUUID "${uuid}")
    home_url=$(sql ZWEBPAGEURL ZUUID "${uuid}")
    title=$(sql ZTITLE ZUUID "${uuid}")
    cat <<EOT
<outline type="rss" text="${title}" title="${title}" xmlUrl="${feed_url}" htmlUrl="${home_url}" />
EOT
done >> ${opml_export}

cat >> ${opml_export} << TAIL
</outline>
</body>
</opml>
TAIL
