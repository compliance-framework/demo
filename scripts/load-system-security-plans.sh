# Don't put a hashbang here!

while ! curl -s --request POST --url http://localhost:8080/api/oscal/system-security-plans --header 'Content-Type: application/json' -d @./oscal-content/system-security-plans/FedRampSystemSecurityPlan.json > /dev/null 2>&1
do
	sleep 10
done
