unittest:
	for i in index.js lib/client.js; \
	do \
	    node -c $$i || exit 1; \
	done
