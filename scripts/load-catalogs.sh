# Don't put a hashbang here!

while ! curl -s --request POST --url http://localhost:8080/api/oscal/catalogs --header 'Content-Type: application/json' -d @./oscal-content/catalogs/NIST_SP-800-53_rev5_catalog.json > /dev/null 2>&1
do
	sleep 10
done
