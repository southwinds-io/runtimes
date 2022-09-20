# Application Runtimes

Current list of application runtimes:

| runtime                    | application type          |
|----------------------------|---------------------------|
| [ubi-minimal](ubi-minimal) | binary apps (e.g. golang) | 

## How to use it?

Assuming an application has been created as an Artisan application package, to launch the application:

```bash
$ docker run --name my-app -d -e ART_PACKAGE_NAME="xxx" -e ART_REG_USER="xxx" -e ART_REG_PWD="xxx" quay.io/artisan/app-run:ubi-minimal
```

For example, if you want to spin up the [basic artisan registry here](https://quay.io/repository/artisan/artr-basic?tab=info) you can 
do the following instead:

```bash
docker run \
   --name artr \
   -d \
   -p 8080:8080 \
   -e ART_PACKAGE_NAME="app/artr-basic" \
   -e ARTR_ADMIN_USER=admin \
   -e ARTR_ADMIN_PWD=adm1n \
   quay.io/artisan/app-run:ubi-minimal
```

The package `app/artr-basic` contains application specific labels that can inform the runtime how to validate 
the application configuration:

```bash
$ art manifest app/artr-basic
...
"labels": {
    "app:entrypoint": "artr",
    "app:var@ARTR_ADMIN_PWD": "required,default=adm1n",
    "app:var@ARTR_ADMIN_USER": "required,default=admin",
    "app:var@ARTR_READ_PWD": "optional",
    "app:var@ARTR_READ_USER": "optional",
    "app:volume@DATA_PATH": "0"
  },
...
```