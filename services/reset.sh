echo "Compose down ..."
docker-compose down

echo "Deleting log data ..."
rm -rf ./**/logs

#echo "Deleting database data ..."
#rm -rf epcis-db/data/*

echo "Prune containers ..."
docker container prune --force

echo "Remove cache images that generate problems ..."
docker image remove services_middleware

echo "Deleting tcp dump data ..."
rm -rf tcpdump/*

echo "Done"