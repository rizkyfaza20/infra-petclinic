# Steps to deploy

To deploy the apps, please refer to [title](https://github.com/rizkyfaza20/spring-petclinic/)


1.  Exec auth to the GCP for checking default application on terraform.

```sh
    gcloud auth application-default login
```
2. Export the variable for GCP Project ID

```sh
    export TF_VAR_project_id="<project-id-name>"
```

3. Try initialize the project

```sh
terraform init
```

2. And then make sure all the configuration met your expectation. Try to plan the Terraform.

```sh
terraform plan
```

3. Apply changes into the platform.

```sh
terraform apply
```