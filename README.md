# Dockerized Nextcloud
<p align="center" width="100%">
<img src="https://upload.wikimedia.org/wikipedia/commons/6/60/Nextcloud_Logo.svg" alt="Nextcloud Logo" width="50%"/>
</p>
<p align="center" width="100%">
<a href="https://nextcloud.com/">Nextcloud</a> deployment made easy.
</p>


## Why?
Well, I used deploying Nextcloud as an excuse (there is already an [official image](https://github.com/nextcloud/all-in-one)) to familiarize myself more with [Docker Compose](https://docs.docker.com/compose/) and its best practices.


## Seamless Deployment
Copy the [dot env file template](.env.example) and populate it.
```sh
cp .env.example .env
```

Create the `credentials` directory and the files that contain the [Docker Secrets](https://docs.docker.com/compose/compose-file/09-secrets/), then populate the credentials with secure passwords.
```sh
mkdir credentials

# PostgreSQL database password
touch credentials/postgres_password.txt

# The password of the Nextcloud admin user
touch credentials/nextcloud_admin_password.txt

# Collabora Office administration password
touch credentials/collabora_password.txt
```

If you want to [store files in another server](https://docs.docker.com/storage/volumes/#share-data-between-machines) or [use custom volume drivers](https://docs.docker.com/storage/volumes/#use-a-volume-driver), create the volume manually and set the external volume configuration on the environmental variables file.
```sh
# Example external volume using a nfs share
docker volume create --driver "local" \
  --opt "type=nfs" \
  --opt "o=addr=<NFS SHARE HOST OR IP>,rw" \
  --opt "device=:<NFS SHARE STORAGE DIRECTORY>" \
  <VOLUME NAME>
```

Pull and start the containers in the [Docker Compose file](docker-compose.yml).
```sh
docker compose pull

docker compose up -d
```

Thats it 🎉, now you have your own Nextcloud instance up and running.