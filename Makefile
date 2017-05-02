unittest:
	for i in index.js lib/client.js; \
	do \
	    nodejs -c $$i || exit 1; \
	done
