url := https://www.ph4.org

all:
	curl -s "$(url)/b4_index.php" | \
	grep -oP 'href="_dl.php[^"]+"' | \
	sed 's/.*a=\([^&]\+\)&.*/"\1.zip"/' | \
	xargs -n1 make

%.zip:
	curl -f -o "$@" "$(url)/_dl.php?back=bbl&a=$(basename $@)&b=mybible&c" || \
	echo "$(url)/_dl.php?back=bbl&a=$(basename $@)&b=mybible&c" >> failed.txt
